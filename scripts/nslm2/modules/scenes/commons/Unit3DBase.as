package nslm2.modules.scenes.commons
{
   import org.specter3d.display.Specter3D;
   import com.mz.core.interFace.IDispose;
   import away3d.materials.methods.ColorTransformMethod;
   import flash.geom.ColorTransform;
   import com.netease.protobuf.UInt64;
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import org.specter3d.events.Avatar3DEvent;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.event.MzEvent;
   import com.greensock.TweenLite;
   import nslm2.utils.ConfigUtil;
   import morn.core.utils.StringUtils;
   import away3d.containers.ObjectContainer3D;
   import away3d.entities.Mesh;
   import away3d.primitives.SphereGeometry;
   import com.mz.core.configs.EnvConfig;
   import away3d.core.base.Geometry;
   import away3d.bounds.BoundingSphere;
   import flash.geom.Vector3D;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.utils.Effect3DUtils;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import away3d.events.AnimatorEvent;
   import flash.events.Event;
   import nslm2.utils.TransformUtil;
   import flash.geom.Point;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.mz.core.utils.MathUtil;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.handlers.Handler;
   import proto.TitleChangeNotify;
   import proto.WearChangeNotify;
   import away3d.materials.methods.EffectMethodBase;
   import nslm2.mgrs.MouseIconManager;
   import away3d.materials.methods.OutlineMethod2;
   import com.mz.core.mgrs.UIMgr;
   import org.specter3d.display.avatar2.Avatar3D;
   import away3d.materials.lightpickers.LightPickerBase;
   import nslm2.utils.RTools;
   import nslm2.common.ui.components.comp3ds.effs.Avatar3DBlurEff;
   import nslm2.common.ui.components.comp3ds.effs.Avatar3DJumpEff;
   import nslm2.common.ui.components.comp3ds.effs.Avatar3DFlashEff;
   
   public class Unit3DBase extends Specter3D implements IDispose, IMouseOutObject3D
   {
      
      public static const ROLE_ID:String = "roleId";
      
      public static const EVENT_CHNAGE_SPEED:String = "EVENT_CHNAGE_SPEED";
      
      public static const EVT_Unit3DBase_runStart:String = "EVT_Unit3DBase_runStart";
      
      public static const EVT_Unit3DBase_runCpl:String = "EVT_Unit3DBase_runCpl";
      
      public static const X2D:String = "x2d";
      
      public static const Y2D:String = "y2d";
      
      private static var _colorTransformMethod:ColorTransformMethod;
       
      
      public var inUI:Boolean = false;
      
      public var useBigTex:Boolean = false;
      
      public var parts:Vector.<IDispose>;
      
      public var actRun:String = "run_3";
      
      public var actStd:String = "std_3";
      
      public var userData:Object;
      
      public var roleId:UInt64;
      
      public var box3D:Specter3D;
      
      public var box3D2:Specter3D;
      
      public var avatar:AvatarBody3D;
      
      public var useDefaultAvatar:Boolean = true;
      
      private var _useShadow:Boolean = true;
      
      public var suitId:uint;
      
      public var wingId:uint;
      
      public var tag3DVBox:nslm2.modules.scenes.commons.Unit3DTagBox;
      
      public var tag3DBottomBox:nslm2.modules.scenes.commons.Unit3DTagBottomBox;
      
      public var stcNpcId:int;
      
      public var isEffectAvatar:Boolean;
      
      private var _mousePriority:int = 3;
      
      public var needShowTreasure:Boolean = true;
      
      private var _attackTreasure:nslm2.modules.scenes.commons.SceneTreasure3D;
      
      private var _defendTreasure:nslm2.modules.scenes.commons.SceneTreasure3D;
      
      public var treasureInitIndex:int;
      
      protected var _visibleList:Object;
      
      public var horseIsLoaded:Boolean = false;
      
      public var horseAvatar:nslm2.modules.scenes.commons.HorseAvatar;
      
      public var curHorseStcModelId:int;
      
      protected var defaultAvatarScallAll:Number;
      
      public var avatar_stcModelVo:StcModelVo;
      
      public var hasAction:Boolean = true;
      
      protected var showVisibleData:nslm2.modules.scenes.commons.Unit3dBaseShowByLimiteDate;
      
      protected var mouseMesh:Mesh;
      
      public var effId:int;
      
      public var eff3dAvatar:SpecterEffect;
      
      private var defaultEffUrl:String;
      
      private var defaultEff3D:SpecterEffect;
      
      private var defaultEff3DBox:Specter3D;
      
      public var isLoaded:Boolean = false;
      
      public var moveSpeed:int;
      
      protected var runHandler;
      
      public var runCplHandler;
      
      public var runPath:Array;
      
      private var _poi2d:Point;
      
      private var _avatarScallAll:Number;
      
      private var _thisScallAll:Number = 1;
      
      public var buttonMode:Boolean = false;
      
      protected var overMethod:EffectMethodBase;
      
      private var debug_over:Boolean;
      
      private var _overMethodEnabled:Boolean = false;
      
      private var _overMethodColor:uint = 16046112;
      
      public var isMouseOver:Boolean;
      
      private var mouseDownTimer:int = 0;
      
      private var mouseDownPoint:Point;
      
      private var _castsShadows:Boolean;
      
      protected var _blurEff:Avatar3DBlurEff;
      
      protected var _jumpEff:Avatar3DJumpEff;
      
      protected var _flashEff:Avatar3DFlashEff;
      
      public function Unit3DBase(param1:ObjectContainer3D = null)
      {
         parts = new Vector.<IDispose>();
         box3D2 = new Specter3D();
         tag3DVBox = new nslm2.modules.scenes.commons.Unit3DTagBox();
         tag3DBottomBox = new nslm2.modules.scenes.commons.Unit3DTagBottomBox();
         treasureInitIndex = Math.random() * 360;
         _visibleList = {};
         moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_WALK;
         _poi2d = new Point();
         mouseDownPoint = new Point();
         super();
         if(param1)
         {
            param1.addChild(this);
         }
         this.addChild(box3D2);
         box3D = this;
         this.addChild(tag3DVBox);
         this.addChild(tag3DBottomBox);
         tag3DVBox.y = 210;
         tag3DVBox.unit3d = this;
      }
      
      public static function get colorTransformMethod() : ColorTransformMethod
      {
         if(_colorTransformMethod == null)
         {
            _colorTransformMethod = new ColorTransformMethod();
            _colorTransformMethod.colorTransform = new ColorTransform(1.4,1.4,1.4,1,0,0,0,0);
         }
         return _colorTransformMethod;
      }
      
      public function get useShadow() : Boolean
      {
         return _useShadow;
      }
      
      public function set useShadow(param1:Boolean) : void
      {
         if(_useShadow != param1)
         {
            _useShadow = param1;
            if(param1)
            {
               if(isLoaded)
               {
                  this.tag3DBottomBox.showShadow();
               }
            }
            else
            {
               this.tag3DBottomBox.hideShadow();
            }
         }
      }
      
      public function initByStcNpcId(param1:int, param2:Boolean = false, param3:int = 0, param4:int = 0) : void
      {
         stcNpcId = param1;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc5_.node))
         {
            PlayerModel.ins.changePlayerViewByPlayerInfo(this,PlayerModel.ins.playerInfo);
         }
         else if(param2)
         {
            this.initByModelId(!!param3?PlayerModel.ins.getModelIdByStcId(param3,param1):!!param4?param4:int(_loc5_.model_id),_loc5_.sex,!!param3?PlayerModel.ins.getWeaponIdByFashionItemId(param3,_loc5_.sex):FactoryUtil.weapon_ModelVos(param1),FactoryUtil.getWingModel3DVoByStcNpcId(param1),55);
         }
         else
         {
            this.initByModelId(!!param3?PlayerModel.ins.getModelIdByStcId(param3,param1):!!param4?param4:int(_loc5_.model_id),_loc5_.sex,!!param3?PlayerModel.ins.getWeaponIdByFashionItemId(param3,_loc5_.sex):FactoryUtil.weapon_ModelVos(param1),FactoryUtil.getWingModel3DVoByStcNpcId(param1));
         }
      }
      
      public function get mousePriority() : int
      {
         return _mousePriority;
      }
      
      public function set mousePriority(param1:int) : void
      {
         if(_mousePriority != param1)
         {
            _mousePriority = param1;
            if(this.avatar && this.avatar.avatarMesh)
            {
               this.avatar.avatarMesh.mousePriority = _mousePriority;
            }
            if(this.mouseMesh)
            {
               this.mouseMesh.mousePriority = _mousePriority;
            }
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         setVisibleList("VISIBLE_KEY_DEFAULT",param1);
         if(this.avatar)
         {
            this.avatar.effectsVisible = this.visible;
         }
      }
      
      public function get attackTreasure() : nslm2.modules.scenes.commons.SceneTreasure3D
      {
         return _attackTreasure;
      }
      
      public function set attackTreasure(param1:nslm2.modules.scenes.commons.SceneTreasure3D) : void
      {
         if(_attackTreasure != param1)
         {
            _attackTreasure = param1;
            if(param1 != null)
            {
               this.tag3DVBox.boxIngoreRoScale.addChild(_attackTreasure);
            }
         }
      }
      
      public function get defendTreasure() : nslm2.modules.scenes.commons.SceneTreasure3D
      {
         return _defendTreasure;
      }
      
      public function set defendTreasure(param1:nslm2.modules.scenes.commons.SceneTreasure3D) : void
      {
         if(_defendTreasure != param1)
         {
            _defendTreasure = param1;
            if(param1 != null)
            {
               this.tag3DVBox.boxIngoreRoScale.addChild(_defendTreasure);
            }
         }
      }
      
      public function createTreasureByBaowuArr(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         this.createTreasure(0,8);
         this.createTreasure(0,9);
         if(param1)
         {
            _loc2_ = param1.length;
            _loc5_ = 0;
            while(_loc5_ < _loc2_)
            {
               _loc4_ = param1[_loc5_];
               _loc3_ = StcMgr.ins.getItemVo(_loc4_);
               this.createTreasure(_loc4_,_loc3_.kind);
               _loc5_++;
            }
         }
      }
      
      public function createTreasure(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         if(param1 && needShowTreasure)
         {
            _loc3_ = StcMgr.ins.getItemVo(param1);
            if(_loc3_.quality >= 7)
            {
               switch(int(param2) - 8)
               {
                  case 0:
                     if(this.attackTreasure)
                     {
                        this.attackTreasure.dispose();
                        this.attackTreasure = null;
                     }
                     this.attackTreasure = new nslm2.modules.scenes.commons.SceneTreasure3D(this,param1);
                     this.attackTreasure.initByModelId(_loc3_.show_id);
                     break;
                  case 1:
                     if(this.defendTreasure)
                     {
                        this.defendTreasure.dispose();
                        this.defendTreasure = null;
                     }
                     this.defendTreasure = new nslm2.modules.scenes.commons.SceneTreasure3D(this,param1);
                     this.defendTreasure.initByModelId(_loc3_.show_id);
               }
            }
         }
         else
         {
            switch(int(param2) - 8)
            {
               case 0:
                  if(this.attackTreasure)
                  {
                     this.attackTreasure.dispose();
                     this.attackTreasure = null;
                  }
                  break;
               case 1:
                  if(this.defendTreasure)
                  {
                     this.defendTreasure.dispose();
                     this.defendTreasure = null;
                     break;
                  }
            }
         }
      }
      
      public function setVisibleList(param1:String, param2:Boolean) : void
      {
         _visibleList[param1] = param2;
         this.validateVisible();
      }
      
      public function getVisibleList(param1:String) : Boolean
      {
         if(_visibleList.hasOwnProperty(param1))
         {
            return _visibleList[param1];
         }
         return true;
      }
      
      protected function validateVisible() : void
      {
         if(this.isDispose)
         {
            return;
         }
         var _loc2_:Boolean = true;
         var _loc4_:int = 0;
         var _loc3_:* = this._visibleList;
         for each(var _loc1_ in this._visibleList)
         {
            if(_loc1_ == false)
            {
               _loc2_ = false;
               break;
            }
         }
         .super.visible = _loc2_;
         if(this.avatar)
         {
            this.avatar.visible = _loc2_;
         }
         if(this.horseAvatar)
         {
            this.horseAvatar.visible = _loc2_;
         }
         if(this.eff3dAvatar)
         {
            this.eff3dAvatar.visible = _loc2_;
         }
         if(this.mouseMesh)
         {
            this.mouseMesh.visible = _loc2_;
         }
         if(this.tag3DBottomBox.shadowTag3D)
         {
            this.tag3DBottomBox.shadowTag3D.visible = _loc2_;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         .super.alpha = param1;
         if(this.avatar)
         {
            this.avatar.alpha = param1;
         }
         if(this.horseAvatar)
         {
            this.horseAvatar.alpha = param1;
         }
         if(this.tag3DBottomBox && this.tag3DBottomBox.shadowTag3D)
         {
            this.tag3DBottomBox.shadowTag3D.alpha = param1;
         }
      }
      
      public function get hasHorse() : Boolean
      {
         return this.curHorseStcModelId > 0;
      }
      
      public function initStcHorseId(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = StcMgr.ins.getSaddlehorseVo(param1);
            if(_loc2_)
            {
               this.initHorseModel(int(_loc2_.model));
            }
            else
            {
               new StcLackFatal(this,"static_saddlehorse",param1);
            }
         }
         else
         {
            this.initHorseModel(0);
         }
      }
      
      public function initHorseModel(param1:int, param2:Number = -1) : void
      {
         if(curHorseStcModelId == param1)
         {
            return;
         }
         this.curHorseStcModelId = param1;
         this.disposeHorseAvatar();
         if(param1 > 0)
         {
            this.horseAvatar = new nslm2.modules.scenes.commons.HorseAvatar();
            this.horseAvatar.alpha = this.alpha;
            this.validateLightPicker(this.horseAvatar);
            this.horseAvatar.inUI = this.inUI;
            this.box3D2.addChild(horseAvatar);
            this.horseAvatar.visible = false;
            this.horseAvatar.delay = param2;
            this.horseAvatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
            this.horseAvatar.initByStcModelId(param1);
         }
         else
         {
            this.validateBindingMount();
         }
         validateMouseEvent();
      }
      
      protected function onHouseAvatarAnimAllComplete(param1:Avatar3DEvent) : void
      {
         if(this.isDispose)
         {
            return;
         }
         this.horseIsLoaded = true;
         horseAvatar.visible = this.visible;
         this.disposeDefaultAvatar();
         horseAvatar.action = "ride_2";
         horseAvatar.stopFrame();
         validateBindingMount();
      }
      
      private function validateBindingMount() : void
      {
         if(horseIsLoaded)
         {
            this.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_HORSE;
            horseAvatar.startFrame();
            horseAvatar.action = "ride_1";
         }
         if(this.isLoaded)
         {
            if(horseIsLoaded)
            {
               this.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_HORSE;
               avatar.rotationX = 90;
               avatar.rotationZ = -180;
               avatar.scaleAll = 1;
               horseAvatar.setAvatarPart("BoneRide",this.avatar);
               horseAvatar.action = "ride_1";
            }
            else
            {
               this.moveSpeed = DefindConsts.MOVE_SPEED_DEFINE_WALK;
               if(avatar.parent != this.box3D2)
               {
                  box3D2.addChild(avatar);
                  avatar.rotationX = 0;
                  avatar.rotationZ = 0;
                  avatar.scaleAll = this.defaultAvatarScallAll * _thisScallAll;
                  var _loc1_:* = avatar.action;
                  if("ride_1" !== _loc1_)
                  {
                     if("ride_2" === _loc1_)
                     {
                        avatar.action = this.actRun;
                     }
                  }
                  else
                  {
                     avatar.action = this.actStd;
                  }
               }
            }
            this.tag3DVBox.validateTag3DBox();
         }
         dispatchEvent(new MzEvent("EVENT_CHNAGE_SPEED"));
      }
      
      public function get showByLimite() : Boolean
      {
         return this.getVisibleList("SCENE_3D_SHOW_BY_LIMITE");
      }
      
      public function set showByLimite(param1:Boolean) : void
      {
         var _loc2_:* = null;
         this.setVisibleList("SCENE_3D_SHOW_BY_LIMITE",param1);
         if(param1 && showVisibleData)
         {
            _loc2_ = showVisibleData;
            showVisibleData = null;
            initByModelId(_loc2_.modelId,_loc2_.sex,_loc2_.weaponModelVos,_loc2_.winModelVo,_loc2_.actType);
         }
      }
      
      public function initByModelId(param1:int, param2:int = 1, param3:Vector.<StcModelVo> = null, param4:StcModelVo = null, param5:int = 1) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:StcModelVo = StcMgr.ins.getModelVo(param1);
         avatar_stcModelVo = _loc7_;
         if(showByLimite == false)
         {
            showVisibleData = new nslm2.modules.scenes.commons.Unit3dBaseShowByLimiteDate();
            showVisibleData.modelId = param1;
            showVisibleData.sex = param2;
            showVisibleData.weaponModelVos = param3;
            showVisibleData.winModelVo = param4;
            showVisibleData.actType = param5;
            return;
         }
         if(_loc7_.kind != 7)
         {
            this.disposeAvatar();
            if(useDefaultAvatar)
            {
               TweenLite.delayedCall(0.3,loadDefaultAvatar,[param2]);
            }
            avatar = FactoryUtil.add3D(this.inUI,_loc7_,param2,param3,param5,param4,this.useBigTex,null,_thisScallAll);
            defaultAvatarScallAll = avatar.scaleAll;
            avatar.scaleAll = avatar.scaleAll * _thisScallAll;
            this.avatar.alpha = this.alpha;
            this.avatar.visible = this.visible;
            this.validateLightPicker(this.avatar);
            avatar.action = this.actStd;
            avatar.actFromParent = true;
            _loc6_ = ConfigUtil.getHasAction(_loc7_.extra);
            if(hasAction && _loc6_)
            {
               avatar.addEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
            }
            else
            {
               avatar.addEventListener("avatar_init_complete",avatarAsset_onCpl);
            }
            avatar.addEventListener("animator_complete",onAnimatorComplete);
            avatar.addEventListener("MAT_LOAD_CPL",onMatLoadComplete);
            validateMouseEvent();
         }
         else
         {
            isEffectAvatar = true;
            if(StringUtils.isNull(_loc7_.effect_id) == false)
            {
               this.disposeAvatar();
               initMouseMesh();
               this.initEff(int(_loc7_.effect_id));
            }
         }
      }
      
      protected function validateMouseEvent() : void
      {
         if(this.horseAvatar)
         {
            switchMouseEvent(this.horseAvatar,true);
         }
         else if(this.avatar)
         {
            this.avatar.mouseEnabled = true;
            this.avatar.mouseChildren = true;
            switchMouseEvent(this.avatar,true);
         }
      }
      
      public function switchMouseEvent(param1:ObjectContainer3D, param2:Boolean) : void
      {
         if(param2)
         {
            param1.addEventListener("mouseOver3d",avatar_mouseOver3D);
            param1.addEventListener("mouseOut3d",avatar_mouseOut3D);
            param1.addEventListener("mouseDown3d",avatar_mouseDown3D);
            param1.addEventListener("mouseUp3d",avatar_mouseUp3D);
         }
         else
         {
            param1.removeEventListener("mouseOver3d",avatar_mouseOver3D);
            param1.removeEventListener("mouseOut3d",avatar_mouseOut3D);
            param1.removeEventListener("mouseDown3d",avatar_mouseDown3D);
            param1.removeEventListener("mouseUp3d",avatar_mouseUp3D);
         }
      }
      
      public function createDebugMesh() : void
      {
         var _loc1_:Mesh = new Mesh(new SphereGeometry(2,12,12),null,true);
         box3D2.addChild(_loc1_);
      }
      
      public function initMouseMesh() : void
      {
         var _loc1_:int = 0;
         if(mouseMesh)
         {
            this.mouseMesh.visible = this.visible;
         }
         else
         {
            _loc1_ = 180;
            if(false && EnvConfig.ins.showDebugModule)
            {
               mouseMesh = new Mesh(new SphereGeometry(_loc1_,16,12),null,true);
            }
            else
            {
               mouseMesh = new Mesh(new Geometry());
            }
            this.mouseMesh.visible = this.visible;
            mouseMesh.y = 110;
            mouseMesh.bounds = new BoundingSphere();
            mouseMesh.bounds.fromSphere(new Vector3D(),_loc1_);
            mouseMesh.mouseEnabled = true;
            switchMouseEvent(this.mouseMesh,true);
            box3D2.addChild(mouseMesh);
            this.mouseMesh.mousePriority = _mousePriority;
         }
      }
      
      protected function initEff(param1:int) : void
      {
         this.effId = param1;
         new GetResEffect3DTask(Effect3DUtils.getUrlBySid(effId)).addCompleteHandler(getEffCpl).exec();
      }
      
      protected function getEffCpl() : void
      {
         if(this.isDispose)
         {
            return;
         }
         eff3dAvatar = EffectManager.createEffect(Effect3DUtils.getUrlBySid(effId),true,this.box3D);
         eff3dAvatar.scaleAll = 1.6;
         eff3dAvatar.visible = this.visible;
      }
      
      private function loadDefaultAvatar(param1:int) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(isLoaded == false && this.horseIsLoaded == false)
         {
            this.initMouseMesh();
            defaultEffUrl = Effect3DUtils.getUrlBySid(param1 == 1?107:106);
            new GetResEffect3DTask(defaultEffUrl).addCompleteHandler(getDefaultAvatarCpl).exec();
         }
      }
      
      private function getDefaultAvatarCpl() : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(this.mouseMesh)
         {
            this.switchMouseEvent(mouseMesh,false);
            this.mouseMesh.dispose();
            this.mouseMesh = null;
         }
         if(this.isLoaded == false && this.horseIsLoaded == false)
         {
            defaultEff3D = EffectManager.createEffect(defaultEffUrl,true,this.box3D);
            if(defaultEff3DBox == null)
            {
               defaultEff3DBox = new Specter3D();
               this.box3D2.addChild(defaultEff3DBox);
            }
            defaultEff3DBox.addChild(defaultEff3D);
            defaultEff3D.scaleAll = 2;
         }
      }
      
      public function changeTex(param1:Boolean) : void
      {
         if(this.useBigTex == param1)
         {
            return;
         }
         this.useBigTex = param1;
         if(avatar && EnvConfig.ins.useMipMap == false)
         {
            if(param1)
            {
               avatar.changeAvatarTexture(avatar_stcModelVo.path_texture_big);
            }
            else
            {
               avatar.changeAvatarTexture(avatar_stcModelVo.path_texture);
            }
         }
      }
      
      protected function avatarAsset_onCpl(param1:Avatar3DEvent) : void
      {
         if(this.isDispose)
         {
            return;
         }
         this.isLoaded = true;
         if(this.avatar && this.avatar.avatarMesh)
         {
            this.avatar.avatarMesh.mousePriority = _mousePriority;
            this.avatar.effectsVisible = this.visible;
         }
         disposeDefaultAvatar();
         this.validateBindingMount();
         if(useShadow)
         {
            showShadow();
         }
         this.dispatchEvent(param1);
      }
      
      protected function onAnimatorComplete(param1:AnimatorEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      protected function onMatLoadComplete(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function get action() : String
      {
         if(avatar)
         {
            return avatar.action;
         }
         return actStd;
      }
      
      public function set action(param1:String) : void
      {
         if(this.avatar)
         {
            avatar.action = param1;
         }
      }
      
      public function get rotation() : Number
      {
         return TransformUtil.ro3Dto2D(this.rotationY);
      }
      
      public function set rotation(param1:Number) : void
      {
         this.setRotation(param1,false);
      }
      
      override public function setRotation(param1:Number, param2:Boolean = false) : void
      {
         super.setRotation(param1,param2);
      }
      
      public function runTo(param1:int, param2:int, param3:* = null) : Array
      {
         this.rotationTweenDurationFrame = 22;
         this.runHandler = param3;
         var _loc5_:Array = _runTo(param1,param2);
         var _loc4_:Unit3DBaseRunData = new Unit3DBaseRunData();
         _loc4_.toX = param1;
         _loc4_.toY = param2;
         _loc4_.runPath = _loc5_;
         this.dispatchEvent(new MzEvent("EVT_Unit3DBase_runStart",_loc4_));
         return _loc5_;
      }
      
      public function stopRun() : void
      {
         this.switchActionRun(false);
         var _loc2_:int = this.pos2d.x;
         var _loc1_:int = this.pos2d.y;
         this.pos2d = new Point(_loc2_,_loc1_);
         TimerManager.ins.clearTimer(runOnLoop);
      }
      
      private function _runTo(param1:int, param2:int) : Array
      {
         var _loc4_:Array = countRunPath(param1,param2);
         if(_loc4_ == null || _loc4_.length == 0)
         {
            runCpl();
            return null;
         }
         this.runPath = _loc4_;
         var _loc3_:int = countRunRo(this.pos2d,_loc4_[0]);
         this.setRotation(-_loc3_,true);
         switchActionRun(true);
         TimerManager.ins.doFrameLoop(1,runOnLoop);
         return this.runPath;
      }
      
      protected function countRunRo(param1:Point, param2:Point) : int
      {
         return MathUtil.roWith2Point(param1,param2);
      }
      
      protected function countRunPath(param1:int, param2:int) : Array
      {
         return [new Point(param1,param2)];
      }
      
      protected function runOnLoop(param1:TimerHandlerVo) : void
      {
         this.runStep(param1.overTimeMs);
      }
      
      protected function runStep(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc6_:Point = runPath[0];
         var _loc2_:Point = this.pos2d;
         var _loc7_:int = MathUtil.disWith2Point(_loc2_,_loc6_);
         var _loc5_:int = moveSpeed / 1000 * param1;
         if(_loc7_ <= _loc5_)
         {
            this.pos2d = _loc6_;
            runPath.shift();
            if(runPath.length == 0)
            {
               runCpl();
            }
            else
            {
               _loc4_ = MathUtil.roWith2Point(_loc2_,runPath[0]);
               this.setRotation(-_loc4_,true);
               switchActionRun(true);
               if(_loc7_ < _loc5_)
               {
                  param1 = param1 - _loc7_ / (moveSpeed / 1000);
                  runStep(param1);
               }
            }
         }
         else
         {
            _loc4_ = MathUtil.roWith2Point(_loc2_,_loc6_);
            _loc3_ = MathUtil.nextPoint(_loc2_,_loc4_,_loc5_);
            this.pos2d = _loc3_;
         }
      }
      
      protected function switchActionRun(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.hasHorse)
            {
               if(this.horseIsLoaded)
               {
                  this.horseAvatar.action = "ride_2";
               }
            }
            else if(avatar)
            {
               avatar.action = this.actRun;
            }
         }
         else if(this.hasHorse)
         {
            if(this.horseIsLoaded)
            {
               this.horseAvatar.action = "ride_1";
            }
         }
         else if(avatar)
         {
            avatar.action = this.actStd;
         }
      }
      
      protected function runCpl() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         this.switchActionRun(false);
         TimerManager.ins.clearTimer(runOnLoop);
         if(runHandler)
         {
            _loc1_ = runHandler;
            runHandler = null;
            Handler.execute(_loc1_);
         }
         if(runCplHandler)
         {
            _loc2_ = runCplHandler;
            runCplHandler = null;
            Handler.execute(_loc2_);
         }
         this.dispatchEvent(new Event("EVT_Unit3DBase_runCpl"));
      }
      
      protected function validatePos() : void
      {
         this.position = new Vector3D(this.pos2d.x,this.pos2d.y,this.z);
      }
      
      public function get pos2d() : Point
      {
         return _poi2d;
      }
      
      public function set pos2d(param1:Point) : void
      {
         _poi2d = param1;
         validatePos();
      }
      
      public function get x2d() : Number
      {
         return _poi2d.x;
      }
      
      public function set x2d(param1:Number) : void
      {
         _poi2d.x = param1;
         validatePos();
      }
      
      public function get y2d() : Number
      {
         return _poi2d.y;
      }
      
      public function set y2d(param1:Number) : void
      {
         _poi2d.y = param1;
         validatePos();
      }
      
      public function set avatarScallAll(param1:Number) : void
      {
         _avatarScallAll = param1;
         if(avatar)
         {
            avatar.scaleAll = param1;
         }
      }
      
      public function get avatarScallAll() : Number
      {
         if(avatar)
         {
            return avatar.scaleAll;
         }
         return _avatarScallAll;
      }
      
      override public function set scaleAll(param1:Number) : void
      {
         _thisScallAll = param1;
         if(avatar)
         {
            avatar.scaleAll = defaultAvatarScallAll * _thisScallAll;
         }
      }
      
      override public function get scaleAll() : Number
      {
         return _thisScallAll;
      }
      
      public function changeTitle(param1:TitleChangeNotify, param2:Boolean = false) : void
      {
         this.tag3DVBox.showTitle(param1.showTitleId,param2);
      }
      
      public function changeWear(param1:WearChangeNotify) : void
      {
         switch(int(param1.kind) - 10)
         {
            case 0:
               this.suitId = param1.id;
               PlayerModel.ins.changePlayerView(this,this.stcNpcId,this.suitId,this.wingId);
               break;
            case 1:
               this.initStcHorseId(param1.id);
               break;
            case 2:
               this.wingId = param1.id;
               PlayerModel.ins.changePlayerView(this,this.stcNpcId,this.suitId,this.wingId);
         }
      }
      
      protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.changeMouseCursor("hand");
      }
      
      protected function setMouseCursorOut() : void
      {
         MouseIconManager.reset();
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      public function get overMethodEnabled() : Boolean
      {
         return _overMethodEnabled;
      }
      
      public function set overMethodEnabled(param1:Boolean) : void
      {
         if(_overMethodEnabled != param1)
         {
            _overMethodEnabled = param1;
            if(!_overMethodEnabled)
            {
               if(overMethod)
               {
                  this.removeMethod(overMethod);
               }
            }
         }
      }
      
      public function get overMethodColor() : uint
      {
         return _overMethodColor;
      }
      
      public function set overMethodColor(param1:uint) : void
      {
         if(_overMethodColor != param1)
         {
            _overMethodColor = param1;
            if(overMethod is OutlineMethod2)
            {
               (overMethod as OutlineMethod2).outlineColor = _overMethodColor;
            }
         }
      }
      
      protected function avatar_mouseOver3D(param1:Event) : void
      {
         isMouseOver = true;
         if(buttonMode)
         {
            setMouseCursorOver();
         }
         if(overMethod == null || overMethod.isDisposed == true)
         {
            overMethod = new OutlineMethod2(_overMethodColor,1.3,false);
         }
         if(_overMethodEnabled && overMethod != null)
         {
            this.addMethod(overMethod);
         }
         this.dispatchEvent(new Event("unitMouseOver"));
      }
      
      public function doMouseOut() : void
      {
         if(this.isDispose)
         {
            return;
         }
         avatar_mouseOut3D(null);
      }
      
      protected function avatar_mouseOut3D(param1:Event) : void
      {
         if(isMouseOver)
         {
            isMouseOver = false;
            if(buttonMode)
            {
               setMouseCursorOut();
            }
            if(this.overMethod != null)
            {
               this.removeMethod(this.overMethod);
            }
            this.dispatchEvent(new Event("unitMouseOut"));
         }
      }
      
      override public function addMethod(param1:EffectMethodBase) : void
      {
         if(avatar)
         {
            if(!avatar.hasMethod(param1))
            {
               avatar.addMethod(param1);
            }
         }
         if(horseAvatar)
         {
            if(!horseAvatar.hasMethod(param1))
            {
               horseAvatar.addMethod(param1);
            }
         }
      }
      
      override public function removeMethod(param1:EffectMethodBase) : void
      {
         if(avatar)
         {
            avatar.removeMethod(param1);
         }
         if(horseAvatar)
         {
            horseAvatar.removeMethod(param1);
         }
      }
      
      protected function avatar_mouseDown3D(param1:Event) : void
      {
         mouseDownTimer = TimerManager.ins.currTimer;
         mouseDownPoint.x = UIMgr.stage.mouseX;
         mouseDownPoint.y = UIMgr.stage.mouseY;
         this.dispatchEvent(new Event("unitMouseTrigger"));
      }
      
      protected function avatar_mouseUp3D(param1:Event) : void
      {
         if(TimerManager.ins.currTimer - mouseDownTimer <= Config.clickDelay)
         {
            if(mouseDownPoint.x - UIMgr.stage.mouseX < 4 && mouseDownPoint.y - UIMgr.stage.mouseY < 4)
            {
               this.dispatchEvent(new Event("unitMouseClick"));
            }
         }
      }
      
      public function set castsShadow(param1:Boolean) : void
      {
         _castsShadows = param1;
         this.validateCastsShadow(this.avatar);
         this.validateCastsShadow(this.horseAvatar);
      }
      
      protected function validateCastsShadow(param1:Avatar3D) : void
      {
         if(param1)
         {
            param1.castsShadows = _castsShadows;
         }
      }
      
      override public function set lightPicker(param1:LightPickerBase) : void
      {
         if(super.lightPicker != param1)
         {
            .super.lightPicker = param1;
            this.validateLightPicker(this.avatar);
            this.validateLightPicker(this.horseAvatar);
         }
      }
      
      protected function validateLightPicker(param1:Avatar3D) : void
      {
         if(param1)
         {
            if(this.lightPicker)
            {
               param1.lightPicker = this.lightPicker;
               param1.castsShadows = true;
               this.validateCastsShadow(this.avatar);
               param1.update(0);
            }
         }
      }
      
      override public function dispose() : void
      {
         if(this.isDispose)
         {
            return;
         }
         TweenLite.killTweensOf(this);
         this.disposeAvatar();
         this.tag3DVBox.dispose();
         this.tag3DVBox = null;
         this.tag3DBottomBox.dispose();
         this.tag3DBottomBox = null;
         this.disposeHorseAvatar();
         if(overMethod)
         {
            overMethod.dispose();
            overMethod = null;
         }
         RTools.disposeArrOrVector(this.parts);
         TimerManager.ins.clearTimer(runOnLoop);
         if(box3D2)
         {
            box3D2.dispose();
            box3D2 = null;
         }
         super.dispose();
         this.dispatchEvent(new MzEvent("dispose"));
      }
      
      private function disposeAvatar() : void
      {
         if(this.tag3DVBox)
         {
            if(tag3DVBox.npcFuncTag)
            {
               switchMouseEvent(tag3DVBox.npcFuncTag,false);
            }
            this.tag3DVBox.clear();
         }
         if(avatar)
         {
            if(overMethod)
            {
               avatar.removeMethod(overMethod);
            }
            this.switchMouseEvent(avatar,false);
            if(hasAction)
            {
               avatar.removeEventListener("avatar_anim_all_complete",avatarAsset_onCpl);
            }
            else
            {
               avatar.removeEventListener("avatar_init_complete",avatarAsset_onCpl);
            }
            avatar.removeEventListener("animator_complete",onAnimatorComplete);
            avatar.removeEventListener("MAT_LOAD_CPL",onMatLoadComplete);
            avatar.dispose();
            avatar = null;
            this.isLoaded = false;
         }
         if(this.mouseMesh)
         {
            this.switchMouseEvent(mouseMesh,false);
            this.mouseMesh.dispose();
            this.mouseMesh = null;
         }
         if(this.eff3dAvatar)
         {
            eff3dAvatar.dispose();
            eff3dAvatar = null;
         }
         disposeDefaultAvatar();
      }
      
      private function disposeDefaultAvatar() : void
      {
         TweenLite.killDelayedCallsTo(loadDefaultAvatar);
         if(this.defaultEff3D)
         {
            this.defaultEff3D.dispose();
            this.defaultEff3D = null;
         }
         if(this.defaultEff3DBox)
         {
            this.defaultEff3DBox.dispose();
            this.defaultEff3DBox = null;
         }
         if(mouseMesh)
         {
            mouseMesh.visible = false;
         }
      }
      
      private function disposeHorseAvatar() : void
      {
         if(horseAvatar != null)
         {
            if(this.overMethod)
            {
               horseAvatar.removeMethod(this.overMethod);
            }
            horseAvatar.setAvatarPart("BoneRide",null,false);
            this.switchMouseEvent(horseAvatar,false);
            horseAvatar.removeEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
            horseAvatar.dispose();
            horseAvatar = null;
            horseIsLoaded = false;
         }
      }
      
      private function showShadow() : void
      {
         this.tag3DBottomBox.showShadow();
         this.tag3DBottomBox.shadowTag3D.visible = this.visible;
      }
      
      public function blurEffect(param1:Vector3D) : void
      {
         if(this.avatar == null || !isLoaded || this.isDispose)
         {
            return;
         }
         if(_blurEff == null)
         {
            _blurEff = new Avatar3DBlurEff(this.avatar,this);
         }
         _blurEff.blurEffect(param1);
      }
      
      public function jump(param1:Point, param2:Number = 500, param3:* = null) : void
      {
         if(this.avatar == null || !isLoaded || this.isDispose)
         {
            return;
         }
         if(_jumpEff == null)
         {
            _jumpEff = new Avatar3DJumpEff(this);
         }
         _jumpEff.endHandler = param3;
         _jumpEff.jump(this.pos2d,param1,param2);
      }
      
      public function flash(param1:Point, param2:Number = 400, param3:* = null) : void
      {
         if(this.avatar == null || !isLoaded || this.isDispose)
         {
            return;
         }
         if(_flashEff == null)
         {
            _flashEff = new Avatar3DFlashEff(this);
         }
         _flashEff.endHandler = param3;
         _flashEff.flash(this.pos2d,param1,param2);
      }
   }
}
