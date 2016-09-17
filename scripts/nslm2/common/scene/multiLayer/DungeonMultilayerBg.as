package nslm2.common.scene.multiLayer
{
   import org.specter3d.display.Specter3D;
   import nslm2.common.scene.multiLayer.scripts.BgScriptBase;
   import nslm2.common.scene.multiLayer.scripts.BgScript101;
   import nslm2.common.scene.multiLayer.scripts.BgScript102;
   import nslm2.common.scene.multiLayer.scripts.BgScript103;
   import nslm2.modules.dungeons.DungeonVo;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.materials.methods.EffectMethodBase;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import away3d.containers.ObjectContainer3D;
   import nslm2.utils.TransformUtil;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.scene.multiLayer.configs.BgMapConfigVo;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import morn.core.handlers.Handler;
   import nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_Eff3D;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_RainOfFire;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_BossFlyAI;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_Tower;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_Mesh;
   import nslm2.common.scene.multiLayer.mapEffects.MapEffect_Sea;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import com.mz.core.configs.ClientConfig;
   import away3d.entities.Entity;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_BgElevatorUp;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_BgElevatorDown;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_BgElevatorRight;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmd_BgElevatorLeft;
   import nslm2.modules.fightPlayer.AvatarEquipBody3D;
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmdBase;
   import away3d.cameras.Camera3D;
   import nslm2.common.scene.multiLayer.configs.BgScriptVo;
   import away3d.core.base.Object3D;
   import nslm2.utils.RTools;
   import flash.geom.Point;
   
   public class DungeonMultilayerBg extends Specter3D
   {
      
      public static const MAP_BASE_ID:int = 101;
       
      
      private var dgVo:DungeonVo;
      
      public var bgAllLayer:Specter3D;
      
      public var effAllLayer:Specter3D;
      
      public var bgLayers:Vector.<nslm2.common.scene.multiLayer.BgLayer>;
      
      public var mainLayer:nslm2.common.scene.multiLayer.BgLayer;
      
      private var _cameraX:Number = 0;
      
      private var _cameraY:Number = 0;
      
      public var blackLayer:Specter3D;
      
      public var blackCover:Image3D;
      
      public var isCreateNormalEff3D:Boolean = true;
      
      private var stcStageVo:StcStageVo;
      
      public var mapId:int;
      
      public var mapConfigId:int;
      
      public var scaleIsBoss:Boolean = false;
      
      public var loadConfigCplHandler;
      
      public var configVo:BgMapConfigVo;
      
      public var effects:Vector.<nslm2.common.scene.multiLayer.BgLayerCtrlBase>;
      
      public var model3ds:Vector.<AvatarEquipBody3D>;
      
      public var bgScripts:Vector.<BgScriptBase>;
      
      private var bgChangeCmd:ScriptCmdBase;
      
      private var _repeatStartPoi:Point;
      
      private var _isBattling:Boolean;
      
      public function DungeonMultilayerBg()
      {
         effects = new Vector.<nslm2.common.scene.multiLayer.BgLayerCtrlBase>();
         model3ds = new Vector.<AvatarEquipBody3D>();
         bgScripts = new Vector.<BgScriptBase>();
         _repeatStartPoi = new Point();
         super();
      }
      
      public static function getScriptsById(param1:int) : BgScriptBase
      {
         var _loc2_:* = null;
         switch(int(param1) - 101)
         {
            case 0:
               _loc2_ = new BgScript101();
               break;
            case 1:
               _loc2_ = new BgScript102();
               break;
            case 2:
               _loc2_ = new BgScript103();
         }
         return _loc2_;
      }
      
      public function get isDg() : Boolean
      {
         return dgVo != null;
      }
      
      public function get cameraY() : Number
      {
         return _cameraY;
      }
      
      public function set cameraY(param1:Number) : void
      {
         _cameraY = param1;
      }
      
      public function get cameraX() : Number
      {
         return _cameraX;
      }
      
      public function set cameraX(param1:Number) : void
      {
         _cameraX = param1;
      }
      
      override public function addMethod(param1:EffectMethodBase) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.addMethod(param1);
         var _loc3_:int = bgLayers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = bgLayers[_loc4_];
            if(_loc2_.tileImg)
            {
               _loc2_.tileImg.addMethod(param1);
            }
            if(_loc2_.img3D)
            {
               _loc2_.img3D.addMethod(param1);
            }
            _loc4_++;
         }
      }
      
      override public function removeMethod(param1:EffectMethodBase) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.removeMethod(param1);
         if(bgLayers == null)
         {
            return;
         }
         var _loc3_:int = bgLayers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = bgLayers[_loc4_];
            if(_loc2_.tileImg)
            {
               _loc2_.tileImg.removeMethod(param1);
            }
            if(_loc2_.img3D)
            {
               _loc2_.img3D.removeMethod(param1);
            }
            _loc4_++;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         .super.alpha = param1;
         if(bgLayers == null)
         {
            return;
         }
         var _loc3_:int = bgLayers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = bgLayers[_loc4_];
            if(_loc2_)
            {
               _loc2_.tileImg.alpha = param1;
            }
            _loc4_++;
         }
      }
      
      public function set dungeonVO(param1:DungeonVo) : void
      {
         dgVo = param1;
         if(dgVo.stcStageVo)
         {
            mapId = dgVo.stcStageVo.map_id;
            mapConfigId = dgVo.stcStageVo.map_config_id;
         }
      }
      
      public function set stcStageId(param1:int) : void
      {
         stcStageVo = StcMgr.ins.getStageVo(param1);
         this.mapId = stcStageVo.map_id;
         this.mapConfigId = stcStageVo.map_config_id;
      }
      
      public function countBgScale(param1:Boolean) : void
      {
         scaleIsBoss = param1;
         if(bgLayers)
         {
            validateBgScaleAll();
         }
      }
      
      private function validateBgScaleAll() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = bgLayers.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = bgLayers[_loc3_];
            _loc1_.scaleAll = TransformUtil.countBgScale(scaleIsBoss,_loc1_.z);
            _loc3_++;
         }
         this.updateLayersPositon(this._cameraX,this._cameraY);
      }
      
      public function init(param1:*) : void
      {
         if(this.isDg)
         {
            bgAllLayer = this;
         }
         else
         {
            bgAllLayer = new Specter3D();
            this.addChild(bgAllLayer);
            effAllLayer = new Specter3D();
            this.addChild(effAllLayer);
            this.mouseChildren = true;
            this.mouseEnabled = true;
            bgAllLayer.rotationX = TransformUtil.scene45roX;
            bgAllLayer.z = 0;
         }
         this.loadConfigCplHandler = param1;
         new GetResTask(82,UrlLib.asset3d(UrlLib.sceneMapConfig(this.mapId,this.mapConfigId))).addHandlers(loadConfigCpl).exec();
      }
      
      private function loadConfigCpl(param1:GetResTask) : void
      {
         if(this.isDispose)
         {
            return;
         }
         var _loc2_:XML = ResMgr.ins.getRes(param1.url);
         configVo = new BgMapConfigVo(this.mapId);
         configVo.parse(_loc2_,isDg);
         if(isDg)
         {
            dgVo.isElevator = configVo.kind == 2;
            dgVo.subSceneRate = configVo.subSceneRate;
         }
         if(this.loadConfigCplHandler)
         {
            Handler.execute(this.loadConfigCplHandler);
         }
      }
      
      public function createLayer(param1:BgLayerConfigVo) : nslm2.common.scene.multiLayer.BgLayer
      {
         var _loc2_:* = null;
         _loc2_ = new nslm2.common.scene.multiLayer.BgLayer();
         _loc2_.multiBg = this;
         _loc2_.configVo = param1;
         if(param1.isMain)
         {
            mainLayer = _loc2_;
         }
         if(isDg == false)
         {
            if(param1.tileImg && (param1.layerZ == 0 || param1.layerZ == 1000))
            {
               param1.layerZ = 0;
            }
         }
         _loc2_.init();
         bgLayers.push(_loc2_);
         bgAllLayer.addChild(_loc2_);
         return _loc2_;
      }
      
      public function createLayerByZ(param1:int) : nslm2.common.scene.multiLayer.BgLayer
      {
         var _loc2_:* = null;
         _loc2_ = new nslm2.common.scene.multiLayer.BgLayer();
         _loc2_.z = param1;
         bgLayers.push(_loc2_);
         bgAllLayer.addChild(_loc2_);
         return _loc2_;
      }
      
      public function createBgLayer() : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:int = 0;
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         bgLayers = new Vector.<nslm2.common.scene.multiLayer.BgLayer>();
         var _loc8_:int = this.mapId;
         _loc2_ = configVo.bgLayerConfigArr.length;
         _loc9_ = 0;
         while(_loc9_ < _loc2_)
         {
            _loc1_ = configVo.bgLayerConfigArr[_loc9_];
            _loc1_.mapId = _loc8_;
            _loc5_ = createLayer(_loc1_);
            BgTransfrom3DVo.setTransfrom(_loc5_,_loc1_.transfrom3D);
            if(_loc1_.kind == 3)
            {
               _loc5_.visible = false;
            }
            if(_loc1_.effect)
            {
               if(_loc1_.effect.isNormalEff3D)
               {
                  if(isCreateNormalEff3D == true)
                  {
                     if(isDg == false)
                     {
                        this.effAllLayer.addChild(_loc5_);
                     }
                     effects.push(new MapEffect_Eff3D(_loc5_));
                  }
               }
               else
               {
                  switch(int(_loc1_.effect.kind) - 1)
                  {
                     case 0:
                        effects.push(new MapEffect_RainOfFire(_loc5_));
                        break;
                     case 1:
                        effects.push(new MapEffect_BossFlyAI(_loc5_));
                        break;
                     case 2:
                        effects.push(new MapEffect_Tower(_loc5_));
                        break;
                     case 3:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     default:
                        effects.push(new MapEffect_Mesh(_loc5_));
                        break;
                     case 10:
                        effects.push(new MapEffect_Sea(_loc5_));
                  }
               }
            }
            if(_loc1_.model3d)
            {
               _loc5_.model3d = new BgModel3D();
               _loc5_.model3d.bgLayerConfigVo = _loc1_;
               _loc5_.model3d.bgLayer = _loc5_;
               _loc5_.model3d.init();
               this.model3ds.push(_loc5_.model3d.avatar);
               addScripts(_loc1_.model3d.scripts,_loc5_,_loc5_.model3d.avatar);
            }
            if(_loc1_.tileImg)
            {
               _loc1_.tileImg.mapId = _loc8_;
               _loc4_ = new TileImg(_loc1_.tileImg,_loc1_.blendMode);
               _loc4_.z = 0;
               _loc5_.childParent.addChild(_loc4_);
               _loc5_.tileImg = _loc4_;
               if(_loc5_.configVo.tileImg.transfrom3D)
               {
                  BgTransfrom3DVo.setTransfrom(_loc4_,_loc5_.configVo.tileImg.transfrom3D);
               }
               else if(this.isDg)
               {
                  _loc4_.x = -ClientConfig.SCENE_BG_W / 2 + _loc1_.tileImg.offsetX;
                  _loc4_.y = ClientConfig.SCENE_BG_H / 2 + _loc1_.tileImg.offsetY;
               }
               else
               {
                  _loc4_.x = _loc1_.tileImg.offsetX;
                  _loc4_.y = _loc1_.tileImg.offsetY;
               }
               if(this.isDg)
               {
                  _loc4_.loadTileAll();
               }
               _loc4_.renderLayer = _loc1_.tileImg.renderLayer;
            }
            if(_loc1_.img3d)
            {
               _loc5_.img3D = new Image3D(UrlLib.sceneImg3D(_loc8_,_loc1_.img3d.id,_loc1_.img3d.imgKind),_loc1_.img3d.oriWidth,_loc1_.img3d.oriHeight,0,true,false,_loc1_.img3d.isAlpha);
               _loc5_.img3D.renderLayer = _loc1_.img3d.renderLayer;
               if(_loc5_.configVo.img3d.transfrom3D)
               {
                  BgTransfrom3DVo.setTransfrom(_loc5_.img3D,_loc5_.configVo.img3d.transfrom3D);
               }
               else if(this.isDg)
               {
                  _loc5_.img3D.x = -ClientConfig.SCENE_BG_W / 2 + _loc1_.img3d.offsetX;
                  _loc5_.img3D.y = ClientConfig.SCENE_BG_H / 2 + _loc1_.img3d.offsetY;
               }
               _loc5_.childParent.addChild(_loc5_.img3D);
               addScripts(_loc1_.img3d.scripts,_loc5_,_loc5_.img3D);
            }
            if(_loc5_.ctrlVec)
            {
               _loc6_ = _loc5_.ctrlVec.length;
               _loc7_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc5_.ctrlVec[_loc7_].play();
                  _loc7_++;
               }
            }
            _loc9_++;
         }
         if(this.isDg)
         {
            _loc5_ = createLayerByZ(500);
            blackLayer = createLayerByZ(500);
            this.blackCover = new Image3D("img/blackCover.png",ClientConfig.SCENE_FIXED_W + ClientConfig.BATTLE_SCENE_SHAKE_GAP * 2,ClientConfig.SCENE_FIXED_H + ClientConfig.BATTLE_SCENE_SHAKE_GAP * 2,0);
            this.blackCover.renderLayer = Entity.DECAL_LAYER;
            _loc5_.childParent.addChild(this.blackCover);
            _loc5_.mouseChildren = false;
            _loc5_.mouseEnabled = false;
            this.blackCover.mouseChildren = false;
            this.blackCover.mouseEnabled = false;
            validateBgScaleAll();
            if(dgVo.isElevator)
            {
               var _loc10_:* = configVo.ctrlKind.id;
               if(21 !== _loc10_)
               {
                  if(22 !== _loc10_)
                  {
                     if(23 !== _loc10_)
                     {
                        if(24 !== _loc10_)
                        {
                           if(51 !== _loc10_)
                           {
                           }
                        }
                        else
                        {
                           bgChangeCmd = new ScriptCmd_BgElevatorLeft(this);
                        }
                     }
                     else
                     {
                        bgChangeCmd = new ScriptCmd_BgElevatorRight(this);
                     }
                  }
                  else
                  {
                     bgChangeCmd = new ScriptCmd_BgElevatorDown(this);
                  }
               }
               else
               {
                  bgChangeCmd = new ScriptCmd_BgElevatorUp(this);
               }
               if(bgChangeCmd)
               {
                  bgChangeCmd.onStart(null);
               }
            }
         }
      }
      
      public function synchroCamera(param1:Camera3D, param2:Boolean = false) : void
      {
         this.position = param1.position;
         this.rotationX = param1.rotationX;
         this.rotationY = param1.rotationY;
         this.rotationZ = param1.rotationZ;
         this.countBgScale(param2);
      }
      
      private function addScripts(param1:Vector.<BgScriptVo>, param2:nslm2.common.scene.multiLayer.BgLayer, param3:Object3D) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            _loc5_ = param1.length;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc6_ = param1[_loc7_];
               _loc4_ = getScriptsById(_loc6_.id);
               if(_loc4_)
               {
                  _loc4_.init(_loc6_,param2,param3);
                  this.bgScripts.push(_loc4_);
                  _loc4_.start();
               }
               _loc4_ = null;
               _loc7_++;
            }
         }
      }
      
      public function updateLayersPositon(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:Number = NaN;
         if(bgLayers == null)
         {
            return;
         }
         _cameraX = param1;
         _cameraY = param2;
         var _loc4_:int = bgLayers.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = bgLayers[_loc6_];
            if(_loc3_ == blackLayer)
            {
               _loc3_.x = 0;
               _loc3_.y = 0;
            }
            else if(_loc3_.configVo)
            {
               _loc5_ = _loc3_.configVo.speedRate;
               if(this.isDg)
               {
                  _loc3_.x = -param1 * _loc3_.scaleX * _loc5_;
                  _loc3_.y = -param2 * _loc3_.scaleY * _loc5_;
               }
               else
               {
                  _loc3_.y = param2 * (1 - _loc5_);
               }
            }
            _loc6_++;
         }
      }
      
      public function disposeParts() : void
      {
         RTools.disposeArrOrVector(effects);
         RTools.disposeArrOrVector(model3ds);
         RTools.disposeArrOrVector(bgScripts);
      }
      
      public function switchLayerKind(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = configVo.bgLayerConfigArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = configVo.bgLayerConfigArr[_loc4_];
            if(_loc2_.kind == param1)
            {
               this.bgLayers[_loc4_].visible = true;
            }
            else
            {
               this.bgLayers[_loc4_].visible = false;
            }
            _loc4_++;
         }
      }
      
      public function loadTileAll() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.bgLayers.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.bgLayers[_loc3_];
            if(_loc1_.tileImg)
            {
               _loc1_.tileImg.loadTileAll();
            }
            _loc3_++;
         }
      }
      
      public function set lookAtPos2d(param1:Point) : void
      {
         updateLayerPosition(param1);
      }
      
      public function updateLayerPosition(param1:Point) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(bgLayers == null)
         {
            return;
         }
         var _loc3_:int = bgLayers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = bgLayers[_loc4_];
            if(_loc2_.tileImg)
            {
               _loc2_.tileImg.lookAtPoi = new Point(param1.x + _loc2_.x,param1.y + _loc2_.y);
            }
            _loc4_++;
         }
      }
      
      public function get repeatStartY() : int
      {
         return _repeatStartPoi.y;
      }
      
      public function set repeatStartY(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         _repeatStartPoi.y = param1;
         var _loc3_:int = bgLayers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = bgLayers[_loc4_];
            if(_loc2_.tileImg)
            {
               _loc2_.tileImg.repeatStartY = _repeatStartPoi.y;
            }
            _loc4_++;
         }
      }
      
      public function get isBattling() : Boolean
      {
         return _isBattling;
      }
      
      public function set isBattling(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = undefined;
         if(_isBattling != param1)
         {
            _isBattling = param1;
            _loc3_ = this.effects.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc2_ = this.effects[_loc4_];
               if(_loc2_ is nslm2.common.scene.multiLayer.BgLayerCtrlBase)
               {
                  (_loc2_ as nslm2.common.scene.multiLayer.BgLayerCtrlBase).isBattling = _isBattling;
               }
               _loc4_++;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(bgChangeCmd != null)
         {
            bgChangeCmd.dispose();
            bgChangeCmd = null;
         }
         disposeParts();
         if(bgLayers != null)
         {
            RTools.disposeArrOrVector(bgLayers);
            bgLayers = null;
         }
         dgVo = null;
         if(mainLayer != null)
         {
            mainLayer.dispose();
            mainLayer = null;
         }
         super.dispose();
      }
   }
}
