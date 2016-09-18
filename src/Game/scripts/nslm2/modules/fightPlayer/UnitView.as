package nslm2.modules.fightPlayer
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.Specter3D;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import game.ui.fightPlayers.UnitView2DUI;
   import away3d.materials.lightpickers.StaticLightPicker;
   import nslm2.modules.scenes.commons.Unit3DTagBottomBox;
   import flash.geom.Point;
   import away3d.entities.Mesh;
   import org.specter3d.display.avatar2.Avatar3D;
   import com.mz.core.configs.EnvConfig;
   import flash.display.Sprite;
   import nslm2.modules.battles.battle.BattleBuffIcon;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.compsEffects.MaskProgressBar;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import org.specter3d.events.Avatar3DEvent;
   import flash.geom.Vector3D;
   import com.greensock.TweenLite;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.MathUtil;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import nslm2.utils.TransformUtil;
   import away3d.materials.ColorMaterial;
   import away3d.materials.MaterialBase;
   import nslm2.modules.battles.battle.FPUtil;
   import flash.events.Event;
   import org.specter3d.context.AppGlobalContext;
   
   public class UnitView extends EventDispatcher implements IDispose
   {
      
      public static const ACTION_CPL:String = "actionCpl";
       
      
      public var isTemp:Boolean = false;
      
      public var vo:nslm2.modules.fightPlayer.UnitVo;
      
      public var avatarBox:Specter3D;
      
      public var avatarBody:AvatarBody3D;
      
      public var state2d:UnitView2DUI;
      
      public var isActived:Boolean = true;
      
      private var _lightPicker:StaticLightPicker;
      
      private var tag3DBottomBox:Unit3DTagBottomBox;
      
      public var isLoaded:Boolean = false;
      
      public var aim:Point;
      
      public var moveSpeed:int;
      
      public var moveEndTimer:int;
      
      private var _anchorPoi:Point;
      
      private var oriShadow:Mesh;
      
      private var _action:String;
      
      private var _pausing:Boolean;
      
      private var _blur_Interval:uint = 0;
      
      private var _blur_objectIndex:int = 0;
      
      private var _blur_objectPool:Vector.<Mesh>;
      
      private var _visible:Boolean;
      
      public var isDisposed:Boolean;
      
      public function UnitView(param1:nslm2.modules.fightPlayer.UnitVo, param2:Sprite)
      {
         avatarBox = new Specter3D();
         tag3DBottomBox = new Unit3DTagBottomBox();
         super();
         if(param1)
         {
            this.construct(param1,param2);
         }
      }
      
      public function set lightPicker(param1:StaticLightPicker) : void
      {
         _lightPicker = param1;
         this.validateLightPicker(this.avatarBody);
      }
      
      protected function validateLightPicker(param1:Avatar3D) : void
      {
         if(param1 && this._lightPicker)
         {
            param1.lightPicker = this._lightPicker;
            param1.update(0);
         }
      }
      
      public function changeTex(param1:Boolean) : void
      {
         if(EnvConfig.ins.useMipMap == false)
         {
            if(param1)
            {
               avatarBody.changeAvatarTexture(vo.body_stcModel3DVo.path_texture_big);
            }
            else
            {
               avatarBody.changeAvatarTexture(vo.body_stcModel3DVo.path_texture);
            }
         }
      }
      
      public function construct(param1:nslm2.modules.fightPlayer.UnitVo, param2:Sprite) : void
      {
         var _loc3_:* = null;
         vo = param1;
         if(EnvConfig.ins.testAuthor != 991)
         {
            avatarBody = FactoryUtil.add3D(false,vo.body_stcModel3DVo,vo.sex,getWeaponModels(),55,vo.wing_stcModel3DVo);
            this.validateLightPicker(this.avatarBody);
            avatarBody.addEventListener("animator_complete",onAnimatorComplete);
            avatarBody.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
            avatarBox.addChild(avatarBody);
         }
         if(EnvConfig.ins.testAuthor != 992)
         {
            state2d = new UnitView2DUI();
            state2d.list_icon.itemRender = BattleBuffIcon;
            state2d.list_icon.dataSource = [];
            param2.addChild(state2d);
            if(param1.isMajor)
            {
               if(ClientConfig.firstBattle == 1)
               {
                  state2d.txt_name.color = ColorLib.qualityColor(3);
               }
               else if(param1.serVo && param1.serVo.avatar && param1.serVo.avatar.length >= 3)
               {
                  state2d.txt_name.color = ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(param1.serVo.avatar[2]));
               }
               else
               {
                  state2d.txt_name.color = ColorLib.qualityColor(3);
               }
            }
            else
            {
               state2d.txt_name.color = ColorLib.qualityColor(param1.stcNpcVo.quality);
            }
            state2d.txt_name.text = String(vo.name);
            state2d.txt_name.visible = false;
            state2d.bar_hp.visible = false;
            state2d.bar_hp.barLabel.size = 10;
            _loc3_ = new MaskProgressBar(this.state2d.bar_hp);
            state2d.parts.push(_loc3_);
            state2d.bar_hp.value = 0.5;
            state2d.visible = false;
         }
         if(this.action && avatarBody)
         {
            avatarBody.action = this.action;
         }
         avatarBox.addChild(tag3DBottomBox);
         if(avatarBody)
         {
            avatarBody.visible = false;
            this.tag3DBottomBox.showShadow();
         }
      }
      
      public function getWeaponModels() : Vector.<StcModelVo>
      {
         var _loc1_:* = undefined;
         _loc1_ = !!vo.fashionId?PlayerModel.ins.getWeaponIdByFashionItemId(vo.fashionId,vo.sex):FactoryUtil.weapon_ModelVos(vo.npc_id);
         return _loc1_;
      }
      
      public function get shadow() : Image3D
      {
         if(tag3DBottomBox)
         {
            return tag3DBottomBox.shadowTag3D;
         }
         return null;
      }
      
      public function init() : void
      {
         vo.state = 1;
         if(this.avatarBody)
         {
            this.action = StateConsts.actionName(vo.state);
            this.validateRo();
            this.validateXY();
         }
      }
      
      private function avatarAsset_onCpl(param1:Avatar3DEvent) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(isActived)
         {
            isLoaded = true;
            if(this.avatarBody)
            {
               avatarBody.visible = true;
            }
         }
         this.dispatchEvent(param1);
      }
      
      public function get anchorPoi() : Point
      {
         return _anchorPoi;
      }
      
      public function set anchorPoi(param1:Point) : void
      {
         _anchorPoi = param1;
      }
      
      public function onAction(param1:String) : uint
      {
         this.action = param1;
         return this.avatarBody.getAnimationTotalTime(param1);
      }
      
      public function runTo(param1:Vector3D, param2:int) : void
      {
         this.action = "run";
         TweenLite.to(this.avatarBox,param2 / 1000,{
            "x":param1.x,
            "overwrite":0,
            "onComplete":run_onCpl
         });
         TweenLite.to(this.avatarBox,param2 / 1000,{
            "y":param1.y,
            "overwrite":0
         });
         TweenLite.to(this.avatarBox,param2 / 1000,{
            "z":param1.z,
            "overwrite":0
         });
      }
      
      private function run_onCpl() : void
      {
         this.action = "std_2";
      }
      
      public function moveTo(param1:Point, param2:int) : void
      {
         this.moveEndTimer = TimerManager.ins.currTimer + param2;
         this.aim = param1;
         this.moveSpeed = MathUtil.disWith2Point(vo.xy,param1) / param2 * 1000;
         vo.state = 21;
         this.action = "run";
         vo.rotation = MathUtil.roWith2Point(vo.xy,this.aim);
         validateRo();
      }
      
      public function playAttackFront() : void
      {
         vo.state = 3;
         this.action = "skill1";
         validateRo();
      }
      
      public function playAttackRear() : void
      {
         vo.state = 3;
         this.action = "skill1";
         validateRo();
      }
      
      public function set xy(param1:Point) : void
      {
         vo.xy = param1.clone();
         validateXY();
      }
      
      public function set x(param1:int) : void
      {
         vo.xy.x = param1;
         this.validateXY();
      }
      
      public function set y(param1:int) : void
      {
         vo.xy.y = param1;
         this.validateXY();
      }
      
      public function get x() : int
      {
         return vo.xy.x;
      }
      
      public function get y() : int
      {
         return vo.xy.y;
      }
      
      public function get y3d() : Number
      {
         return avatarBox.y;
      }
      
      public function set y3d(param1:Number) : void
      {
         avatarBox.y = param1;
      }
      
      public function onFrame(param1:TimerHandlerVo) : void
      {
         var _loc2_:int = 0;
         if(!(int(vo.state) - 21))
         {
            if(TimerManager.ins.currTimer >= moveEndTimer)
            {
               vo.xy = aim;
               avatarBox.position = TransformUtil.fight2Dto3D(vo.xy.x,vo.xy.y);
               vo.state = 1;
               this.action = "std_2";
               this.validateRo();
            }
            else
            {
               _loc2_ = MathUtil.roWith2Point(vo.xy,this.aim);
               vo.xy = MathUtil.nextPoint(vo.xy,_loc2_,this.moveSpeed * param1.overTimeMs / 1000);
               avatarBox.position = TransformUtil.fight2Dto3D(vo.xy.x,vo.xy.y);
            }
         }
         this.validateStateBar();
      }
      
      public function validateXY() : void
      {
         var _loc1_:Vector3D = TransformUtil.fight2Dto3D(vo.xy.x,vo.xy.y);
         _loc1_.y = avatarBox.y;
         avatarBox.position = _loc1_;
         this.validateStateBar();
      }
      
      public function switchState2d(param1:Boolean) : void
      {
         if(state2d)
         {
            state2d.visible = param1;
         }
         this.validateStateBar();
      }
      
      public function switchStateBar(param1:Boolean) : void
      {
         if(state2d)
         {
            state2d.bar_hp.visible = param1;
         }
         this.validateStateBar();
      }
      
      public function validateStateBar() : void
      {
         var _loc1_:* = null;
         if(state2d && state2d.visible && avatarBody)
         {
            _loc1_ = TransformUtil.stage3Dto2D(avatarBody.scenePosition,state2d.parent);
            state2d.x = _loc1_.x;
            state2d.y = _loc1_.y - 180;
            state2d.bar_hp.value = vo.hp / vo.hp_max;
         }
      }
      
      public function validateRo() : void
      {
         TransformUtil.setBattleOri(avatarBox,avatarBody,vo);
      }
      
      public function showOriShadow(param1:nslm2.modules.fightPlayer.UnitVo, param2:AvatarBody3D) : void
      {
         var _loc3_:* = null;
         if(oriShadow == null)
         {
            oriShadow = param2.bodyClone;
            oriShadow.castsShadows = false;
            _loc3_ = new ColorMaterial(13421721);
            oriShadow.material = _loc3_;
            oriShadow.position = param2.position;
         }
         (oriShadow.material as ColorMaterial).alpha = 0.5;
      }
      
      public function hideOriShadow(param1:nslm2.modules.fightPlayer.UnitVo, param2:AvatarBody3D) : void
      {
         if(oriShadow)
         {
            (oriShadow.material as ColorMaterial).alpha = 0;
         }
      }
      
      public function setRotation(param1:Number, param2:Boolean) : void
      {
         this.avatarBox.setRotation(param1,param2);
      }
      
      public function onHeal() : void
      {
      }
      
      public function onMove() : void
      {
         vo.state == 21;
         this.avatarBody.playbackSpeed = vo.moveSpeed;
         this.action = "run";
      }
      
      public function onFree(param1:Boolean = false) : void
      {
         if(param1 && this.aim)
         {
            vo.xy = FPUtil.nextXY(vo.xy,aim,0);
            avatarBox.position = TransformUtil.fight2Dto3D(vo.xy.x,vo.xy.y);
         }
         vo.state == 1;
         this.action = "std_2";
         this.validateRo();
      }
      
      public function onHurt() : void
      {
         if(vo.state == 1 || vo.state == 5)
         {
            if(this.action == "hurt_1")
            {
               this.action = "run";
            }
            this.action = "hurt_1";
         }
      }
      
      public function onDead() : void
      {
         vo.state == 44;
         this.action = "dead";
      }
      
      public function onWin() : void
      {
         if(vo.hp != 0)
         {
            vo.state = 66;
            this.action = "win";
         }
      }
      
      private function onAnimatorComplete(param1:Event) : void
      {
         if(isDisposed)
         {
            return;
         }
         if(isActived)
         {
            var _loc2_:* = this.action;
            if("hurt_1" !== _loc2_)
            {
               if("win" !== _loc2_)
               {
                  if("win" === _loc2_)
                  {
                     this.action = "run";
                  }
               }
               else if(vo.state == 66)
               {
                  this.action = "run";
                  this.action = "win";
               }
            }
            else if(vo.state == 1)
            {
               this.action = StateConsts.actionName(1);
            }
         }
         this.dispatchEvent(new Event("actionCpl"));
      }
      
      public function get visible() : Boolean
      {
         return _visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _visible = param1;
         this.avatarBox.visible = param1;
         if(state2d)
         {
            this.state2d.alpha = !!param1?1:0;
         }
      }
      
      public function get action() : String
      {
         return _action;
      }
      
      public function set action(param1:String) : void
      {
         _action = param1;
         if(this.avatarBody)
         {
            avatarBody.action = _action;
         }
      }
      
      public function get pausing() : Boolean
      {
         return _pausing;
      }
      
      public function set pausing(param1:Boolean) : void
      {
         if(_pausing != param1)
         {
            _pausing = param1;
            if(this.avatarBody)
            {
               if(_pausing)
               {
                  avatarBody.addMethod(FPUtil.getDarkMethod());
                  avatarBody.playbackSpeed = 0;
               }
               else
               {
                  avatarBody.removeMethod(FPUtil.getDarkMethod());
                  avatarBody.playbackSpeed = 1;
               }
            }
         }
      }
      
      public final function blurEffect(param1:Vector3D) : void
      {
         vec = param1;
         if(this.avatarBody == null || !isLoaded || this.isDisposed)
         {
            return;
         }
         if(_blur_Interval == 3)
         {
            onComplete = function():void
            {
               if(blurMesh)
               {
                  blurMesh.visible = false;
               }
            };
            _blur_Interval = 0;
            if(!_blur_objectPool)
            {
               _blur_objectPool = new Vector.<Mesh>(5);
            }
            var _colorMaterial:ColorMaterial = null;
            if(_blur_objectIndex > 4)
            {
               _blur_objectIndex = 0;
            }
            var blurMesh:Mesh = _blur_objectPool[_blur_objectIndex];
            if(blurMesh == null)
            {
               blurMesh = this.avatarBody.bodyClone;
               blurMesh.animator = null;
               blurMesh.castsShadows = false;
               _colorMaterial = new ColorMaterial(13421721);
               _colorMaterial.alphaPremultiplied = true;
               _colorMaterial.alphaBlending = true;
               _colorMaterial.alpha = 0.3;
               _colorMaterial.blendMode = "layer";
               blurMesh.material = _colorMaterial;
            }
            else
            {
               _colorMaterial = blurMesh.material as ColorMaterial;
               _colorMaterial.alpha = 0.3;
            }
            blurMesh.visible = true;
            blurMesh.position = vec;
            blurMesh.scaleX = this.avatarBody.scaleX;
            blurMesh.scaleY = this.avatarBody.scaleY;
            blurMesh.scaleZ = this.avatarBody.scaleZ;
            blurMesh.rotationX = this.avatarBox.rotationX;
            blurMesh.rotationY = this.avatarBox.rotationY;
            blurMesh.rotationZ = this.avatarBox.rotationZ;
            AppGlobalContext.stage3d.addChild(blurMesh);
            _blur_objectPool[_blur_objectIndex] = blurMesh;
            TweenLite.to(_colorMaterial,0.5,{
               "alpha":0,
               "onComplete":onComplete
            });
            _blur_objectIndex = Number(_blur_objectIndex) + 1;
         }
         _blur_Interval = Number(_blur_Interval) + 1;
      }
      
      public function deadFadeOut() : void
      {
      }
      
      public function dispose() : void
      {
         this.isDisposed = true;
         if(this.avatarBox)
         {
            this.avatarBox.dispose();
            this.avatarBox = null;
         }
         if(this.avatarBody)
         {
            TweenLite.killTweensOf(this.avatarBox);
            this.avatarBody.dispose();
            this.avatarBody = null;
         }
         if(this.state2d && this.state2d.isDisposed == false)
         {
            this.state2d.dispose();
            this.state2d = null;
         }
         if(tag3DBottomBox)
         {
            tag3DBottomBox.dispose();
            tag3DBottomBox = null;
         }
      }
   }
}
