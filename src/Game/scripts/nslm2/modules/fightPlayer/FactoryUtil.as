package nslm2.modules.fightPlayer
{
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.configs.EnvConfig;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.configs.ClientConfig;
   import org.specter3d.display.avatar2.WeaponObject;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.ConfigUtil;
   import org.specter3d.display.avatar2.data.AvatarEffectVO;
   import nslm2.common.ui.components.comp3ds.avatars.WingAvatar;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   
   public class FactoryUtil
   {
       
      
      public function FactoryUtil()
      {
         super();
      }
      
      public static function preload3D(param1:Boolean, param2:StcModelVo, param3:int = 0, param4:Vector.<StcModelVo> = null, param5:int = 1, param6:StcModelVo = null, param7:Boolean = false, param8:int = 2) : void
      {
         var _loc9_:* = null;
         var _loc16_:* = null;
         var _loc14_:* = null;
         var _loc12_:int = 0;
         var _loc15_:* = null;
         var _loc10_:* = null;
         var _loc18_:* = null;
         var _loc13_:* = null;
         var _loc17_:* = null;
         if(param5 == 0)
         {
            param5 = 1;
         }
         var _loc11_:Number = param2.scale <= 0?DefindConsts.SCENE_AVATAR_SCALE_SCENE:Number(param2.scale);
         if(param1 && param2.ui_scale > 0)
         {
            _loc11_ = _loc11_ * param2.ui_scale;
         }
         if(param8 == 2)
         {
            if(EnvConfig.ins.useMipMap)
            {
               _loc9_ = param2.path_texture_mip_dxt;
            }
            else if(param7)
            {
               _loc9_ = param2.path_texture_big;
            }
            else if(_loc11_ > 3.5)
            {
               _loc9_ = param2.path_texture_big;
            }
            else
            {
               _loc9_ = param2.path_texture;
            }
         }
         else if(param8 == 1)
         {
            _loc9_ = param2.path_texture_mip_dxt;
         }
         else
         {
            _loc9_ = param2.path_texture;
         }
         if(EnvConfig.ins.useZipBaAct)
         {
            if(param2.kind == 10)
            {
               if(param3 == 1)
               {
                  _loc16_ = StcMgr.ins.getModelVo(DefindConsts.roleBaseModel3DId_male);
               }
               else
               {
                  _loc16_ = StcMgr.ins.getModelVo(DefindConsts.roleBaseModel3DId_female);
               }
               new LoadZipS3dActTask(null,_loc16_.pathFolder,param2.pathFolder,param2.path_s3d,_loc9_,param5,true).exec();
            }
            else
            {
               new LoadZipS3dActTask(null,param2.pathFolder,null,param2.path_s3d,_loc9_,param5,true).exec();
            }
         }
         if(param4)
         {
            _loc12_ = 0;
            while(_loc12_ < param4.length)
            {
               _loc15_ = param4[_loc12_];
               if(_loc15_)
               {
                  if(_loc12_ == 0)
                  {
                     _loc10_ = "WeaponBone_R";
                  }
                  else
                  {
                     _loc10_ = "WeaponBone_L";
                  }
                  if(ClientConfig.firstBattle == 1)
                  {
                     _loc18_ = new WeaponObject(_loc10_);
                     _loc18_.initAvatar(_loc15_.path_s3d,_loc15_.path_texture_auto);
                  }
                  if(!StringUtils.isNull(_loc15_.effect_id))
                  {
                     _loc13_ = _loc15_.effect_id.split("|");
                     var _loc20_:int = 0;
                     var _loc19_:* = _loc13_;
                     for each(_loc14_ in _loc13_)
                     {
                        _loc17_ = StcMgr.ins.getSpecialEffectVo(int(_loc14_));
                        new GetResEffect3DTask(UrlLib.e3d_particle(_loc17_.effect)).exec();
                     }
                  }
               }
               _loc12_++;
            }
         }
         if(param6)
         {
            preloadWing(param6);
         }
         if(!StringUtils.isNull(param2.effect_id))
         {
            _loc13_ = param2.effect_id.split("|");
            var _loc22_:int = 0;
            var _loc21_:* = _loc13_;
            for each(_loc14_ in _loc13_)
            {
               _loc17_ = StcMgr.ins.getSpecialEffectVo(int(_loc14_));
               new GetResEffect3DTask(UrlLib.e3d_particle(_loc17_.effect)).exec();
            }
         }
      }
      
      public static function add3D(param1:Boolean, param2:StcModelVo, param3:int = 0, param4:Vector.<StcModelVo> = null, param5:int = 1, param6:StcModelVo = null, param7:Boolean = false, param8:* = null, param9:Number = 1) : AvatarEquipBody3D
      {
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc20_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc14_:int = 0;
         var _loc19_:* = null;
         var _loc12_:* = null;
         var _loc22_:* = null;
         var _loc16_:* = null;
         var _loc21_:* = null;
         var _loc13_:Number = NaN;
         if(param5 == 0)
         {
            param5 = 1;
         }
         _loc11_ = new AvatarEquipBody3D();
         var _loc15_:Number = param2.scale > 0?param2.scale:Number(DefindConsts.SCENE_AVATAR_SCALE_SCENE);
         if(param1 && param2.ui_scale > 0)
         {
            _loc15_ = _loc15_ * param2.ui_scale;
         }
         _loc11_.scale(_loc15_);
         _loc11_.bothSides = true;
         _loc11_.alphaBlend = true;
         if(StringUtils.isNull(param2.extra) == false)
         {
            ConfigUtil.setExtra(_loc11_,param2.extra);
         }
         if(param8 == null)
         {
            _loc11_.mipmap = EnvConfig.ins.useMipMap;
         }
         else
         {
            _loc11_.mipmap = Boolean(param8);
         }
         if(EnvConfig.ins.useMipMap)
         {
            _loc10_ = param2.path_texture_mip_dxt;
         }
         else if(param7)
         {
            _loc10_ = param2.path_texture_big;
         }
         else if(_loc15_ > 3.5)
         {
            _loc10_ = param2.path_texture_big;
         }
         else
         {
            _loc10_ = param2.path_texture;
         }
         if(EnvConfig.ins.useZipBaAct)
         {
            if(param2.kind == 10)
            {
               if(param3 == 1)
               {
                  _loc20_ = StcMgr.ins.getModelVo(DefindConsts.roleBaseModel3DId_male);
               }
               else
               {
                  _loc20_ = StcMgr.ins.getModelVo(DefindConsts.roleBaseModel3DId_female);
               }
               new LoadZipS3dActTask(_loc11_,_loc20_.pathFolder,param2.pathFolder,param2.path_s3d,_loc10_,param5,_loc11_.bothSides).exec();
            }
            else
            {
               new LoadZipS3dActTask(_loc11_,param2.pathFolder,null,param2.path_s3d,_loc10_,param5,_loc11_.bothSides).exec();
            }
         }
         if(param4)
         {
            _loc14_ = 0;
            while(_loc14_ < param4.length)
            {
               _loc19_ = param4[_loc14_];
               if(_loc19_)
               {
                  if(_loc14_ == 0)
                  {
                     _loc12_ = "WeaponBone_R";
                  }
                  else
                  {
                     _loc12_ = "WeaponBone_L";
                  }
                  _loc22_ = new WeaponObject(_loc12_);
                  _loc22_.initAvatar(_loc19_.path_s3d,_loc19_.path_texture_auto);
                  if(!StringUtils.isNull(_loc19_.effect_id))
                  {
                     _loc16_ = _loc19_.effect_id.split("|");
                     var _loc24_:int = 0;
                     var _loc23_:* = _loc16_;
                     for each(_loc17_ in _loc16_)
                     {
                        _loc21_ = StcMgr.ins.getSpecialEffectVo(int(_loc17_));
                        _loc18_ = new AvatarEffectVO();
                        _loc18_.effectUrl = UrlLib.e3d_particle(_loc21_.effect);
                        _loc18_.boneTag = _loc21_.tag;
                        _loc18_.billboard = _loc21_.other == 1;
                        _loc22_.addEffect(_loc18_);
                     }
                  }
                  _loc11_.addBindingPart(_loc22_);
               }
               _loc14_++;
            }
         }
         if(param6)
         {
            addWing(_loc11_,param6);
         }
         if(!StringUtils.isNull(param2.effect_id))
         {
            _loc16_ = param2.effect_id.split("|");
            var _loc26_:int = 0;
            var _loc25_:* = _loc16_;
            for each(_loc17_ in _loc16_)
            {
               _loc21_ = StcMgr.ins.getSpecialEffectVo(int(_loc17_));
               _loc13_ = _loc21_.scale <= 0?1:Number(_loc21_.scale);
               _loc18_ = new AvatarEffectVO();
               _loc18_.effectUrl = UrlLib.e3d_particle(_loc21_.effect);
               _loc18_.boneTag = _loc21_.tag;
               _loc18_.billboard = _loc21_.other == 1;
               _loc18_.scale = _loc13_;
               _loc11_.addEffect(_loc18_);
            }
         }
         return _loc11_;
      }
      
      public static function preloadWing(param1:StcModelVo) : void
      {
         new LoadZipS3dActTask(null,param1.pathFolder,null,param1.path_s3d,param1.path_texture_auto,0,ConfigUtil.getBothSides(param1.extra,true)).exec();
      }
      
      public static function addWing(param1:AvatarEquipBody3D, param2:StcModelVo) : WingAvatar
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc5_:WingAvatar = new WingAvatar();
         _loc5_.init(param2);
         if(!StringUtils.isNull(param2.effect_id))
         {
            _loc4_ = param2.effect_id.split("|");
            var _loc9_:int = 0;
            var _loc8_:* = _loc4_;
            for each(var _loc3_ in _loc4_)
            {
               _loc6_ = StcMgr.ins.getSpecialEffectVo(int(_loc3_));
               _loc7_ = new AvatarEffectVO();
               _loc7_.effectUrl = UrlLib.e3d_particle(_loc6_.effect);
               _loc7_.boneTag = _loc6_.tag;
               _loc7_.billboard = _loc6_.other == 1;
               _loc5_.addEffect(_loc7_);
            }
         }
         param1.addBindingPart(_loc5_);
         return _loc5_;
      }
      
      public static function weapon_ModelVos(param1:int) : Vector.<StcModelVo>
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc2_)
         {
            return weapon_ModelVosByStr(_loc2_.weapon_id);
         }
         return new Vector.<StcModelVo>();
      }
      
      public static function weapon_ModelVosByStr(param1:String) : Vector.<StcModelVo>
      {
         var _loc4_:* = null;
         var _loc2_:* = undefined;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         if(StringUtils.isNull(param1) == false)
         {
            _loc4_ = param1.split("|");
            _loc2_ = new Vector.<StcModelVo>();
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc3_ = _loc4_[_loc5_];
               if(_loc3_ > 0)
               {
                  _loc2_.push(StcMgr.ins.getModelVo(_loc3_));
               }
               else
               {
                  _loc2_.push(null);
               }
               _loc5_++;
            }
            return _loc2_;
         }
         return new Vector.<StcModelVo>();
      }
      
      public static function getWingModel3DVoByStcNpcId(param1:int) : StcModelVo
      {
         var _loc2_:* = 0;
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc3_)
         {
            _loc2_ = uint(_loc3_.wing_id);
            if(_loc2_)
            {
               return StcMgr.ins.getModelVo(_loc2_);
            }
         }
         return null;
      }
   }
}
