package nslm2.common.ctrls
{
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.scenes.commons.SceneModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.configs.EnvConfig;
   import org.specter3d.loaders.AssetLib;
   import nslm2.modules.battles.battle.FPUtil;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.configs.particle.SpecterEffectData;
   import org.specter3d.configs.particle.EmmiterData;
   import org.specter3d.configs.particle.SpecterParticleData;
   
   public class CountAssetsCtrl
   {
      
      private static var _ins:nslm2.common.ctrls.CountAssetsCtrl;
       
      
      private var mainCityAssetsBak:Array;
      
      public function CountAssetsCtrl()
      {
         mainCityAssetsBak = [];
         super();
      }
      
      public static function get ins() : nslm2.common.ctrls.CountAssetsCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.ctrls.CountAssetsCtrl();
         }
         return _ins;
      }
      
      public function countPlayerAssets() : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(ClientConfig.firstBattle == 1)
         {
            return ["battle/texture/yingzi.png"];
         }
         var _loc1_:Array = [];
         _loc1_ = _loc1_.concat(countMainCityAssets());
         _loc1_.push("battle/texture/yingzi.png");
         _loc1_ = _loc1_.concat(countEff3dAssets(107));
         _loc1_ = _loc1_.concat(countEff3dAssets(106));
         var _loc2_:Vector.<HeroInfo> = HeroModel.ins.getPositionHeros();
         var _loc4_:int = _loc2_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc2_[_loc5_];
            _loc1_ = _loc1_.concat(countHeroAssets(_loc3_));
            _loc5_++;
         }
         return _loc1_;
      }
      
      private function countMainCityAssets() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         if(SceneModel.ins.sceneId && SceneModel.ins.mapConfigVo)
         {
            _loc2_ = [];
            _loc3_ = StcMgr.ins.getStageVo(SceneModel.ins.sceneId);
            if(_loc3_.kind == 4)
            {
               _loc4_ = SceneModel.ins.mapConfigVo.bgLayerConfigArr.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc1_ = SceneModel.ins.mapConfigVo.bgLayerConfigArr[_loc5_];
                  if(_loc1_.tileImg)
                  {
                     mainCityAssetsBak = countSceneBgImgAssets(_loc3_.map_id,_loc1_.tileImg);
                     mainCityAssetsBak.push(_loc1_.tileImg.smallURL);
                     _loc2_ = _loc2_.concat(mainCityAssetsBak);
                  }
                  _loc5_++;
               }
            }
         }
         return mainCityAssetsBak;
      }
      
      private function countSceneBgImgAssets(param1:int, param2:BgTileImgConfigVo) : Array
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:Array = [];
         var _loc3_:int = Math.ceil(param2.oriWidth / param2.tileWidth);
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc6_ = Math.ceil(param2.oriHeight / param2.tileHeight);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc4_.push(UrlLib.sceneMapTileImg(param1,param2.id,_loc7_,_loc5_,param2.imgKind == "png"));
               _loc5_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function countHeroAssets(param1:HeroInfo) : Array
      {
         var _loc5_:* = undefined;
         var _loc2_:Array = [];
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         var _loc3_:int = _loc6_.model_id;
         _loc2_ = _loc2_.concat(countModelAssets(_loc3_));
         var _loc4_:Vector.<StcModelVo> = FactoryUtil.weapon_ModelVos(param1.baseInfo.baseId);
         _loc2_ = _loc2_.concat(countWeaponAssets(_loc4_));
         if(HeroModel.ins.isCurPlayerHero(param1.baseInfo.id))
         {
            if(PlayerModel.ins.suitModelId)
            {
               _loc2_ = _loc2_.concat(countModelAssets(PlayerModel.ins.suitModelId));
               _loc5_ = PlayerModel.ins.getWeaponIdByFashionItemId(PlayerModel.ins.playerInfo.suit,_loc6_.sex);
               _loc2_ = _loc2_.concat(countWeaponAssets(_loc5_));
            }
            if(PlayerModel.ins.wingModelId)
            {
               _loc2_ = _loc2_.concat(countModelAssets(PlayerModel.ins.wingModelId));
            }
         }
         _loc2_ = _loc2_.concat(this.countStcNpcVoEffAssets(_loc6_));
         return _loc2_;
      }
      
      public function countWeaponAssets(param1:Vector.<StcModelVo>) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_)
            {
               _loc2_ = _loc2_.concat(countModelAssets(_loc3_.id));
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function countModelAssets_ba(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:StcModelVo = StcMgr.ins.getModelVo(param1);
         if(_loc3_)
         {
            _loc2_.push(UrlLib.asset3d(_loc3_.pathFolder + "s3d_act1.ba"));
            _loc2_.push(UrlLib.asset3d(_loc3_.pathFolder + "s3d_act2.ba"));
         }
         return _loc2_;
      }
      
      public function countModelAssets(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:StcModelVo = StcMgr.ins.getModelVo(param1);
         if(_loc3_)
         {
            _loc2_.push(_loc3_.pathFolder + "s3d_act1.ba");
            _loc2_.push(_loc3_.pathFolder + "s3d_act2.ba");
            _loc2_ = _loc2_.concat(countBaAssets(_loc3_.pathFolder,"s3d_act1.ba"));
            _loc2_ = _loc2_.concat(countBaAssets(_loc3_.pathFolder,"s3d_act2.ba"));
            if(EnvConfig.ins.useMipMap)
            {
               _loc2_.push(_loc3_.path_texture_mip_dxt);
            }
            else
            {
               _loc2_.push(_loc3_.path_texture_dxt);
               _loc2_.push(_loc3_.path_texture_big_dxt);
            }
         }
         return _loc2_;
      }
      
      public function countBaAssets(param1:String, param2:String) : Array
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc7_:* = AssetLib.getData(param1 + param2);
         if(_loc7_ is Array)
         {
            _loc6_ = _loc7_ as Array;
            if(_loc6_)
            {
               _loc5_ = _loc6_.length;
               _loc8_ = 0;
               while(_loc8_ < _loc5_)
               {
                  _loc4_ = _loc6_[_loc8_];
                  _loc3_.push(param1 + _loc4_);
                  _loc8_++;
               }
            }
         }
         return _loc3_;
      }
      
      public function countStcNpcVoEffAssets(param1:StcNpcVo, param2:Boolean = false) : Array
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         if(param1)
         {
            _loc5_ = FPUtil.getEffectIdByNpcVo(param1);
            _loc6_ = _loc5_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = _loc5_[_loc7_];
               _loc4_ = _loc4_.concat(countEff3dAssets(_loc3_,param2));
               _loc7_++;
            }
         }
         return _loc4_;
      }
      
      public function countEff3dAssets(param1:int, param2:Boolean = false) : Array
      {
         var _loc5_:* = null;
         var _loc10_:* = null;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         SkillConfig.intConfig();
         var _loc3_:Array = [];
         var _loc4_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(param1);
         if(_loc4_)
         {
            _loc5_ = UrlLib.e3d_particle(_loc4_.effect);
            if(param2)
            {
               _loc3_.push(_loc5_.replace(".ect",".ba"));
            }
            if(AssetLib.hasAsset(_loc5_))
            {
               _loc3_.push(_loc5_);
               _loc10_ = AssetLib.getData(_loc5_) as SpecterEffectData;
               _loc9_ = _loc10_.emmiterArr.length;
               _loc11_ = 0;
               while(_loc11_ < _loc9_)
               {
                  _loc8_ = _loc10_.emmiterArr[_loc11_];
                  _loc6_ = UrlLib.e3d_particle(_loc8_.url);
                  if(AssetLib.hasAsset(_loc6_))
                  {
                     _loc3_.push(_loc6_);
                     _loc7_ = _loc8_.pData;
                     if(_loc7_.meshData.shapeType == "external" && _loc7_.meshData.url)
                     {
                        _loc3_.push(UrlLib.e3d_particle(_loc7_.meshData.url));
                     }
                     if(_loc7_.meshData.materialType == "texture" && _loc7_.meshData.textureUrl)
                     {
                        _loc3_.push(UrlLib.e3d_particle(_loc7_.meshData.textureUrl));
                        _loc3_.push(UrlLib.e3d_particle(_loc7_.meshData.textureUrl.replace(".png",".dxt")));
                        if(_loc7_.meshData.useMask && _loc7_.meshData.maskUrl != "")
                        {
                           _loc3_.push(UrlLib.e3d_particle(_loc7_.meshData.maskUrl));
                           _loc3_.push(UrlLib.e3d_particle(_loc7_.meshData.maskUrl.replace(".png",".dxt")));
                        }
                     }
                  }
                  _loc11_++;
               }
            }
         }
         return _loc3_;
      }
   }
}
