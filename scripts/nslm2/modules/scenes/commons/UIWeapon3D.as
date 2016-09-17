package nslm2.modules.scenes.commons
{
   import org.specter3d.display.Specter3D;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import morn.core.utils.StringUtils;
   import org.specter3d.display.avatar2.Avatar3D;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.avatar2.AvatarPart3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import org.specter3d.display.avatar2.WeaponObject;
   import org.specter3d.display.avatar2.data.AnimData;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import away3d.events.MouseEvent3D;
   import nslm2.common.compsEffects.Avatar3DAutoRotationYCtrl;
   import nslm2.common.ui.components.comp3ds.ctrls.WeaponDragCtrl;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.utils.FunctionDelegate;
   import org.specter3d.loaders.AssetLib;
   import away3d.textures.Texture2DBase;
   import away3d.materials.TextureMaterial;
   import morn.core.utils.ColorUtil;
   import away3d.core.base.SubMesh;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import away3d.materials.lightpickers.LightPickerBase;
   import nslm2.common.ui.components.debug3d.Param3DRender;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class UIWeapon3D extends Specter3D
   {
      
      public static const RESET_ROTATION_Y:int = 0;
       
      
      public var extra_envMap:Object;
      
      private var mipmap:Boolean;
      
      public var box:Specter3D;
      
      public var weapon3d:Avatar3D;
      
      private var nmUrl:String;
      
      private var spUrl:String;
      
      private var reUrl:String;
      
      private var skyboxUrl:String;
      
      public var effIds:String;
      
      public var eff:SpecterEffect;
      
      private var isMeshLoadCpl:Boolean = false;
      
      private var isMatLoadCpl:Boolean = false;
      
      private var spBmTex:Texture2DBase;
      
      private var autoRoCtrl:Avatar3DAutoRotationYCtrl;
      
      private var dragCtrl:WeaponDragCtrl;
      
      private var stcModelVo:StcModelVo;
      
      private var _debug_gloss:Param3DRender;
      
      public function UIWeapon3D()
      {
         box = new Specter3D();
         super();
         this.addChild(box);
         box.rotationY = -15;
         box.scaleAll = DefindConsts.AVATAR_SCALE_WEAPON_UI;
      }
      
      public static function getEffId(param1:StcItemVo, param2:int) : int
      {
         var _loc7_:* = 0;
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc9_:String = param1.extend_3;
         if(StringUtils.isNull(_loc9_))
         {
            return 0;
         }
         _loc7_ = 0;
         _loc3_ = 0;
         _loc5_ = _loc9_.split("|");
         _loc8_ = _loc5_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc4_ = _loc5_[_loc10_].split(":");
            _loc6_ = _loc4_[0];
            if(param2 >= _loc6_)
            {
               _loc7_ = _loc6_;
               _loc3_ = _loc4_[1];
               _loc10_++;
               continue;
            }
            break;
         }
         return _loc3_;
      }
      
      public function getEntityHeight() : Number
      {
         if(weapon3d)
         {
            return weapon3d.avatarMesh.bounds.max.z - weapon3d.avatarMesh.bounds.min.z;
         }
         return 0;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         if(weapon3d && weapon3d is AvatarPart3D)
         {
            AvatarPart3D(weapon3d).effectsVisible = param1;
         }
      }
      
      public function initByModelId(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = undefined;
         stcModelVo = StcMgr.ins.getModelVo(param1);
         if(stcModelVo.kind == 8)
         {
            weapon3d = new AvatarPart3D(null);
            weapon3d.rotationY = 90;
         }
         else
         {
            weapon3d = new WeaponObject();
            weapon3d.rotationY = 0;
         }
         box.addChild(weapon3d);
         weapon3d.addEventListener("MAT_LOAD_CPL",matLoadCpl);
         weapon3d.addEventListener("avatar_init_complete",weaponLoadCpl);
         mipmap = true;
         weapon3d.mipmap = mipmap;
         if(stcModelVo.ui_scale != 0)
         {
            weapon3d.scaleAll = stcModelVo.ui_scale;
         }
         if(stcModelVo.kind == 8)
         {
            _loc3_ = new AnimData("std1");
            _loc3_.animUrl = stcModelVo.pathFolder + "std1" + ".act";
            _loc2_ = new Vector.<AnimData>();
            _loc2_.push(_loc3_);
            AvatarPart3D(weapon3d).registerAnims(_loc2_);
            weapon3d.addEventListener("avatar_anim_all_complete",onAvatarAnimAllComplete);
            weapon3d.initAvatar(stcModelVo.path_s3d,!!mipmap?stcModelVo.path_texture_mip_dxt:stcModelVo.path_texture_dxt);
         }
         else
         {
            weapon3d.initAvatar(stcModelVo.path_mesh,!!mipmap?stcModelVo.path_texture_mip_dxt:stcModelVo.path_texture_dxt);
         }
         weapon3d.addEventListener("mouseDown3d",avatar_mouseDown);
      }
      
      private function onAvatarAnimAllComplete(param1:Event) : void
      {
         if(weapon3d)
         {
            AvatarPart3D(weapon3d).action = "std1";
            AvatarPart3D(weapon3d).isAllowBinding = true;
         }
      }
      
      public function changeEff(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         if(effIds == param1)
         {
            return;
         }
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
         effIds = param1;
         if(!StringUtils.isNull(param1))
         {
            if(weapon3d is AvatarPart3D)
            {
               _loc3_ = param1.split("|");
               var _loc8_:int = 0;
               var _loc7_:* = _loc3_;
               for each(var _loc2_ in _loc3_)
               {
                  _loc4_ = StcMgr.ins.getSpecialEffectVo(int(_loc2_));
                  _loc6_ = new AvatarEffectVO();
                  _loc6_.effectUrl = UrlLib.e3d_particle(_loc4_.effect);
                  _loc6_.boneTag = _loc4_.tag;
                  _loc6_.billboard = _loc4_.other == 1;
                  AvatarPart3D(weapon3d).addEffect(_loc6_);
               }
            }
            else
            {
               _loc5_ = param1.split("|");
               if(_loc5_.length >= 1)
               {
                  eff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(int(_loc5_[0])),true);
                  weapon3d.addChild(eff);
               }
            }
         }
      }
      
      private function weaponLoadCpl(param1:Event) : void
      {
         if(this.isDispose)
         {
            return;
         }
         weapon3d.removeEventListener("avatar_init_complete",weaponLoadCpl);
         this.isMeshLoadCpl = true;
         if(this.isMeshLoadCpl && this.isMatLoadCpl)
         {
            allLoadCpl();
         }
      }
      
      private function matLoadCpl(param1:Event) : void
      {
         if(this.isDispose)
         {
            return;
         }
         weapon3d.removeEventListener("MAT_LOAD_CPL",matLoadCpl);
         this.isMatLoadCpl = true;
         if(this.isMeshLoadCpl && this.isMatLoadCpl)
         {
            allLoadCpl();
         }
      }
      
      private function weapon3d_mouseDown(param1:MouseEvent3D) : void
      {
         autoRoCtrl.pause();
         dragCtrl.dragStart();
      }
      
      private function onDragEnd(param1:Event) : void
      {
         autoRoCtrl.resume();
      }
      
      protected function allLoadCpl() : void
      {
         weapon3d.mouseEnabled = true;
         weapon3d.mouseChildren = true;
         weapon3d.avatarMesh.mouseEnabled = true;
         autoRoCtrl = new Avatar3DAutoRotationYCtrl(box);
         weapon3d.avatarMesh.addEventListener("mouseDown3d",weapon3d_mouseDown);
         dragCtrl = new WeaponDragCtrl(box);
         dragCtrl.addEventListener("dragEnd",onDragEnd);
         nmUrl = !!mipmap?this.stcModelVo.path_texture_nm_mip_dxt:this.stcModelVo.path_texture_nm_dxt;
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo(nmUrl),FunctionDelegate.create(load_nm_cpl,[nmUrl]));
         spUrl = !!mipmap?this.stcModelVo.path_texture_sp_mip_dxt:this.stcModelVo.path_texture_sp_dxt;
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo(spUrl),FunctionDelegate.create(load_sp_cpl,[spUrl]));
      }
      
      private function load_nm_cpl(param1:String) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(param1 != this.nmUrl)
         {
            return;
         }
         var _loc3_:Texture2DBase = AssetLib.getATFTexture(param1);
         var _loc2_:TextureMaterial = weapon3d.avatarMesh.material as TextureMaterial;
         _loc2_.normalMap = _loc3_;
      }
      
      private function load_sp_cpl(param1:String) : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(param1 != this.spUrl)
         {
            return;
         }
         spBmTex = AssetLib.getATFTexture(param1);
         var _loc2_:TextureMaterial = weapon3d.avatarMesh.material as TextureMaterial;
         _loc2_.specularMethod.gloss = 57;
         if(debug_gloss)
         {
            this.debug_gloss.bind(_loc2_.specularMethod,"gloss");
         }
         _loc2_.specularMap = spBmTex;
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo("particle/texture/jpg_377_01.dxt"),FunctionDelegate.create(loadFlowDxtDone,["particle/texture/jpg_377_01.dxt"]));
      }
      
      private function loadFlowDxtDone(param1:String) : void
      {
         var _loc2_:* = null;
         if(!weapon3d || !weapon3d.avatarMesh)
         {
            return;
         }
         var _loc4_:Texture2DBase = AssetLib.getATFTexture(param1);
         var _loc3_:TextureMaterial = new TextureMaterial(_loc4_,true,true);
         _loc3_.colorTransform = ColorUtil.getColorTransform(16769442);
         _loc3_.renderPriority = weapon3d.avatarMesh.material.renderPriority + 1;
         _loc3_.animateUVs = true;
         _loc3_.alpha = 0.8;
         _loc3_.blendMode = "add";
         _loc2_ = new SubMesh(weapon3d.avatarMesh.subMeshes[0].subGeometry,weapon3d.avatarMesh,_loc3_);
         weapon3d.avatarMesh.subMeshes.push(_loc2_);
         _loc2_ = new SubMesh(weapon3d.avatarMesh.subMeshes[0].subGeometry,weapon3d.avatarMesh,_loc3_);
         weapon3d.avatarMesh.subMeshes.push(_loc2_);
         TimerManager.ins.doFrameLoop(2,updateUV);
      }
      
      private function updateUV() : void
      {
         if(!weapon3d.avatarMesh || weapon3d.avatarMesh.subMeshes.length <= 1)
         {
            return;
         }
         var _loc4_:SubMesh = weapon3d.avatarMesh.subMeshes[1];
         var _loc3_:* = Number(_loc4_.offsetU);
         if(_loc3_ <= -1)
         {
            _loc3_ = 0;
         }
         _loc3_ = Number(_loc3_ - 0.002);
         _loc4_.offsetU = _loc3_;
         var _loc2_:SubMesh = weapon3d.avatarMesh.subMeshes[2];
         var _loc1_:* = Number(_loc2_.offsetV);
         if(_loc1_ <= -1)
         {
            _loc1_ = 0;
         }
         _loc1_ = Number(_loc1_ - 0.004);
         _loc2_.offsetV = _loc1_;
      }
      
      public function reset() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = NaN;
         if(autoRoCtrl)
         {
            autoRoCtrl.pause();
         }
         if(box.rotationY > 360)
         {
            box.rotationY = box.rotationY - 360;
         }
         if(box.rotationY < 200)
         {
            _loc2_ = 0;
            _loc1_ = 0.4;
         }
         else
         {
            _loc2_ = 360 + 0;
            _loc1_ = 0.6;
         }
         TweenLite.to(box,_loc1_,{
            "rotationY":_loc2_,
            "rotationX":0,
            "onComplete":resetComplete
         });
      }
      
      private function resetComplete() : void
      {
         box.rotationY = 0;
         box.rotationX = 0;
      }
      
      public function restartRotate() : void
      {
         if(autoRoCtrl)
         {
            autoRoCtrl.resume();
         }
      }
      
      private function avatar_mouseDown(param1:Event) : void
      {
      }
      
      private function disposeEffCtr() : void
      {
         if(autoRoCtrl)
         {
            autoRoCtrl.dispose();
            autoRoCtrl = null;
         }
         if(dragCtrl)
         {
            dragCtrl.dispose();
            dragCtrl = null;
         }
      }
      
      override public function dispose() : void
      {
         if(this.weapon3d)
         {
            weapon3d.removeEventListener("MAT_LOAD_CPL",matLoadCpl);
            weapon3d.removeEventListener("avatar_init_complete",weaponLoadCpl);
            weapon3d.removeEventListener("mouseDown3d",avatar_mouseDown);
            weapon3d.dispose();
            weapon3d = null;
         }
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
         disposeEffCtr();
         TimerManager.ins.clearTimer(this.updateUV);
         super.dispose();
      }
      
      override public function set lightPicker(param1:LightPickerBase) : void
      {
         .super.lightPicker = param1;
         this.weapon3d.lightPicker = param1;
         this.weapon3d.update(0);
      }
      
      public function get debug_gloss() : Param3DRender
      {
         return _debug_gloss;
      }
      
      public function set debug_gloss(param1:Param3DRender) : void
      {
         var _loc2_:* = null;
         _debug_gloss = param1;
         if(weapon3d && weapon3d.avatarMesh && weapon3d.avatarMesh.material)
         {
            _loc2_ = weapon3d.avatarMesh.material as TextureMaterial;
            if(_loc2_)
            {
               this.debug_gloss.bind(_loc2_.specularMethod,"gloss");
            }
         }
      }
      
      public function get gloss() : int
      {
         var _loc1_:* = null;
         if(weapon3d && weapon3d.avatarMesh && weapon3d.avatarMesh.material)
         {
            _loc1_ = weapon3d.avatarMesh.material as TextureMaterial;
            if(_loc1_)
            {
               return _loc1_.gloss;
            }
         }
         return 0;
      }
   }
}
