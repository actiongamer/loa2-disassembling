package nslm2.mgrs.stcMgrs
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcMgrConfigVo;
   import com.mz.core.logging.Log;
   import com.mz.core.configs.EnvConfig;
   import global.GlobalManager;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.stcMgrs.vos.StcGlobalPriceVo;
   import nslm2.mgrs.stcMgrs.vos.StcDefineVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.mgrs.stcMgrs.vos.StcLanguageVo;
   import nslm2.mgrs.stcMgrs.vos.StcMapVo;
   import nslm2.mgrs.stcMgrs.vos.StcUiFadeVo;
   import nslm2.mgrs.stcMgrs.vos.StcSevendayTaskVo;
   import nslm2.mgrs.stcMgrs.vos.StcFadeVo;
   import nslm2.mgrs.stcMgrs.vos.StcXinshouTipsVo;
   import nslm2.mgrs.stcMgrs.vos.StcBglvIntvlVo;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.vos.StcUiPublishVo;
   import nslm2.mgrs.stcMgrs.vos.StcWorldBossVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import nslm2.mgrs.stcMgrs.vos.StcSevendayRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcDropGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcAuthorityVo;
   import nslm2.mgrs.stcMgrs.vos.StcManifestoVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroPeiyangLimitVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipSuitVo;
   import nslm2.mgrs.stcMgrs.vos.StcCrossArenaMassVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgresGatherVo;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiVo;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiFlagVo;
   import nslm2.mgrs.stcMgrs.vos.StcCwarTimeVo;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianBuffVo;
   import nslm2.mgrs.stcMgrs.vos.StcArenaRankDisplayVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuAttrVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgtitleIntvlVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyBossVo;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionOpenTipsVo;
   import nslm2.mgrs.stcMgrs.vos.StcSupportDevelopVo;
   import nslm2.mgrs.stcMgrs.vos.StcGoddessScoreRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcGeneralWelfareVo;
   import nslm2.mgrs.stcMgrs.vos.StcRechargeVo;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.mgrs.stcMgrs.vos.StcMallActivityVo;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import nslm2.mgrs.stcMgrs.vos.StcDropBaseVo;
   import nslm2.mgrs.stcMgrs.vos.StcNichengVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuStrengthVo;
   import nslm2.mgrs.stcMgrs.vos.StcCharmRankBuyVo;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.mgrs.stcMgrs.vos.StcNichengSuffixVo;
   import nslm2.mgrs.stcMgrs.vos.StcAssistantLevelVo;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.mgrs.stcMgrs.vos.StcDefineSpecialVo;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianMonsterVo;
   import nslm2.mgrs.stcMgrs.vos.StcTitleVo;
   import nslm2.mgrs.stcMgrs.vos.StcGambleVo;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import nslm2.mgrs.stcMgrs.vos.StcGrowthVo;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.mgrs.stcMgrs.vos.StcEliteStageInvadeVo;
   import nslm2.mgrs.stcMgrs.vos.StcUiMornVo;
   import nslm2.mgrs.stcMgrs.vos.StcResourceStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorseupgradeVo;
   import nslm2.mgrs.stcMgrs.vos.StcSpringFirecrackerRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyExpeTaskVo;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroPeiyangVo;
   import nslm2.mgrs.stcMgrs.vos.StcBklvIntvlVo;
   import nslm2.mgrs.stcMgrs.vos.StcOpenFundVo;
   import nslm2.mgrs.stcMgrs.vos.StcMallItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyTechCostVo;
   import nslm2.mgrs.stcMgrs.vos.StcSuperscaleVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcTimePriceVo;
   import nslm2.mgrs.stcMgrs.vos.StcTeambattleRelationVo;
   import nslm2.mgrs.stcMgrs.vos.StcYunbiaoVo;
   import nslm2.mgrs.stcMgrs.vos.Stc2dSpecialEffectVo;
   import nslm2.mgrs.stcMgrs.vos.StcNichengPrefixVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageChapterVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroNodeVo;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianRandomjiangliVo;
   import nslm2.mgrs.stcMgrs.vos.StcMilitarygradeVo;
   import nslm2.mgrs.stcMgrs.vos.StcSourceRetrivalVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyBossZuheVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import nslm2.mgrs.stcMgrs.vos.StcNewFunctionVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroDescVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeTypeVo;
   import nslm2.mgrs.stcMgrs.vos.StcBginfoVo;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import nslm2.mgrs.stcMgrs.vos.StcGonghuiZhiweiVo;
   import nslm2.mgrs.stcMgrs.vos.StcTaskVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.vos.StcLoadingTipsVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentInfoVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import nslm2.mgrs.stcMgrs.vos.StcHorsejingtongVo;
   import nslm2.mgrs.stcMgrs.vos.StcGlobalPriceQqVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroSkinSuitVo;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgrankAwardVo;
   import nslm2.mgrs.stcMgrs.vos.StcClotheSuitVo;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.mgrs.stcMgrs.vos.StcPlatformDefineVo;
   import nslm2.mgrs.stcMgrs.vos.StcGeneralCreditsPrizeVo;
   import nslm2.mgrs.stcMgrs.vos.StcSigninExtraRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcSysMailVo;
   import nslm2.mgrs.stcMgrs.vos.StcPetStarVo;
   import nslm2.mgrs.stcMgrs.vos.StcValentineBuyVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillEffectVo;
   import nslm2.mgrs.stcMgrs.vos.StcMysticShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import nslm2.mgrs.stcMgrs.vos.StcBgeloIntvlVo;
   import nslm2.mgrs.stcMgrs.vos.Stc14DayTaskVo;
   import nslm2.mgrs.stcMgrs.vos.StcChargeVo;
   import nslm2.mgrs.stcMgrs.vos.StcMinePublicVo;
   import nslm2.mgrs.stcMgrs.vos.StcFengcejiangliVo;
   import nslm2.mgrs.stcMgrs.vos.StcRecommendHeroVo;
   import nslm2.mgrs.stcMgrs.vos.StcPlayerqualityVo;
   import nslm2.mgrs.stcMgrs.vos.StcWorldBossZuheVo;
   import nslm2.mgrs.stcMgrs.vos.StcLessVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeNanduVo;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookInviteRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcAuctionVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuKeyinVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridPageVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationPageVo;
   import nslm2.mgrs.stcMgrs.vos.StcSensitiveWordVo;
   import nslm2.mgrs.stcMgrs.vos.StcCrossArenaCheerVo;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import nslm2.mgrs.stcMgrs.vos.StcVipVo;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.mgrs.stcMgrs.vos.StcShopFunctionVo;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyBossRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcSysNoticeVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAttrVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.mgrs.stcMgrs.vos.StcSigninRewardVo;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import nslm2.mgrs.stcMgrs.vos.StcRobotVo;
   
   public class StcMgr
   {
      
      private static var _ins:nslm2.mgrs.stcMgrs.StcMgr;
       
      
      public var configMap:DictHash;
      
      var tableMap:Object;
      
      public function StcMgr()
      {
         configMap = new DictHash();
         tableMap = {};
         super();
         registerClassMap();
      }
      
      public static function get ins() : nslm2.mgrs.stcMgrs.StcMgr
      {
         if(_ins == null)
         {
            _ins = new nslm2.mgrs.stcMgrs.StcMgr();
         }
         return _ins;
      }
      
      public function clear() : void
      {
         this.tableMap = {};
      }
      
      private function register(param1:Class) : void
      {
         var _loc2_:StcMgrConfigVo = new StcMgrConfigVo();
         _loc2_.voClass = param1;
         if(param1.hasOwnProperty("STC_NAME"))
         {
            _loc2_.stcName = param1["STC_NAME"];
         }
         else
         {
            Log.fatal(this,"Lack STC_NAME in " + param1);
         }
         if(param1.hasOwnProperty("PRIMARY_KEY"))
         {
            _loc2_.primaryKey = param1["PRIMARY_KEY"];
         }
         else
         {
            Log.fatal(this,"Lack PRIMARY_KEY in " + param1);
         }
         configMap.put(_loc2_.stcName,_loc2_);
      }
      
      public function clearStc(param1:String) : void
      {
      }
      
      public function addItemArr(param1:String, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(EnvConfig.ins.showQQModule)
         {
            if(param1 == "static_global_price")
            {
               return;
            }
            if(param1 == "static_global_price_qq")
            {
               param1 = "static_global_price";
            }
            if(param1 == "static_loading_tips")
            {
               return;
            }
            if(param1 == "static_loading_tips_qq")
            {
               param1 = "static_loading_tips";
            }
         }
         if(configMap.containsKey(param1))
         {
            _loc4_ = param2.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = param2[_loc5_];
               if(!(_loc3_ == null || !_loc3_[0]))
               {
                  nslm2.mgrs.stcMgrs.StcMgr.ins.addItem(param1,_loc3_);
                  if(param1 == "static_ui_morn")
                  {
                     GlobalManager.addMornGlobalData(_loc3_);
                  }
                  if(param1 == "static_ui_publish")
                  {
                     GlobalManager.addPublishGlobalData(_loc3_);
                  }
                  _loc5_++;
                  continue;
               }
               break;
            }
         }
         else
         {
            Log.fatal(this,"没有注册表",param1);
         }
      }
      
      private function addItem(param1:String, param2:Array) : void
      {
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:StcMgrConfigVo = configMap.getValue(param1) as StcMgrConfigVo;
         var _loc6_:DictHash = getTabel(param1);
         var _loc8_:StcVoBase = new _loc4_.voClass() as StcVoBase;
         _loc8_.parse(param2);
         if(param1 == "static_function")
         {
            if(StcFunctionVo(_loc8_).gameid.toString() == ClientConfig.gameId)
            {
               if(!EnvConfig.ins.useStaticDevDEV)
               {
                  _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
               }
               else
               {
                  _loc7_ = _loc6_.getValue(_loc8_[_loc4_.primaryKey]);
                  if(_loc7_ != null && _loc7_.gameid != -1)
                  {
                     _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
                  }
               }
            }
            else if(StcFunctionVo(_loc8_).gameid == -1)
            {
               if(EnvConfig.ins.useStaticDevDEV)
               {
                  _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
               }
            }
            else if(_loc6_.containsKey(_loc8_[_loc4_.primaryKey]) == false)
            {
               _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
            }
         }
         else if(param1 == "static_global_price")
         {
            if(StcGlobalPriceVo(_loc8_).gameid.toString() == ClientConfig.gameId)
            {
               if(!EnvConfig.ins.useStaticDevDEV)
               {
                  _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
               }
               else
               {
                  _loc3_ = _loc6_.getValue(_loc8_[_loc4_.primaryKey]);
                  if(_loc3_ != null && _loc3_.gameid != -1)
                  {
                     _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
                  }
               }
            }
            else if(StcGlobalPriceVo(_loc8_).gameid == -1)
            {
               if(EnvConfig.ins.useStaticDevDEV)
               {
                  _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
               }
            }
            else if(_loc6_.containsKey(_loc8_[_loc4_.primaryKey]) == false)
            {
               _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
            }
         }
         else
         {
            _loc6_.put(_loc8_[_loc4_.primaryKey],_loc8_);
         }
         if(param1 == "static_define")
         {
            _loc5_ = _loc8_ as StcDefineVo;
            if((DefindConsts as Class).hasOwnProperty(_loc5_.define_name))
            {
               DefindConsts[_loc5_.define_name] = _loc5_.define_value;
            }
         }
      }
      
      public function getTabelArr(param1:String) : Array
      {
         return getTabel(param1).array;
      }
      
      public function getTabel(param1:String) : DictHash
      {
         if(!tableMap.hasOwnProperty(param1))
         {
            tableMap[param1] = new DictHash();
         }
         return tableMap[param1];
      }
      
      public function getVo(param1:String, param2:*) : StcVoBase
      {
         var _loc3_:* = null;
         var _loc4_:DictHash = getTabel(param1);
         if(EnvConfig.ins.showDebugModule)
         {
            if(param2 == 0)
            {
            }
            _loc3_ = _loc4_.getValue(param2) as StcVoBase;
            if(_loc3_ == null)
            {
            }
            return _loc3_;
         }
         return _loc4_.getValue(param2) as StcVoBase;
      }
      
      private function registerClassMap() : void
      {
         register(StcLanguageVo);
         register(StcMapVo);
         register(StcDefineVo);
         register(StcUiFadeVo);
         register(StcSevendayTaskVo);
         register(StcFadeVo);
         register(StcXinshouTipsVo);
         register(StcBglvIntvlVo);
         register(StcBuffVo);
         register(StcUiPublishVo);
         register(StcWorldBossVo);
         register(StcEquipJinglianVo);
         register(StcSevendayRewardVo);
         register(StcDropGroupVo);
         register(StcAuthorityVo);
         register(StcManifestoVo);
         register(StcHeroTalentVo);
         register(StcHeroPeiyangLimitVo);
         register(StcEquipSuitVo);
         register(StcCrossArenaMassVo);
         register(StcBgresGatherVo);
         register(StcChapterVo);
         register(StcGonghuiVo);
         register(StcGonghuiFlagVo);
         register(StcCwarTimeVo);
         register(StcNvshendianBuffVo);
         register(StcArenaRankDisplayVo);
         register(StcFashionSynVo);
         register(StcBaowuAttrVo);
         register(StcBgtitleIntvlVo);
         register(StcFamilyBossVo);
         register(StcFunctionOpenTipsVo);
         register(StcSupportDevelopVo);
         register(StcGoddessScoreRewardVo);
         register(StcGeneralWelfareVo);
         register(StcRechargeVo);
         register(StcMilitaryrankVo);
         register(StcEquipAddStarVo);
         register(StcMallActivityVo);
         register(StcSpecialEffectVo);
         register(StcDropBaseVo);
         register(StcNichengVo);
         register(StcBaowuStrengthVo);
         register(StcCharmRankBuyVo);
         register(StcGuajiVo);
         register(StcEquipStrengthVo);
         register(StcNichengSuffixVo);
         register(StcAssistantLevelVo);
         register(StcRankVo);
         register(StcDefineSpecialVo);
         register(StcNvshendianMonsterVo);
         register(StcTitleVo);
         register(StcGambleVo);
         register(StcPetStatusVo);
         register(StcFacebookFeedVo);
         register(StcGrowthVo);
         register(StcCountryIconVo);
         register(StcEliteStageInvadeVo);
         register(StcUiMornVo);
         register(StcResourceStageVo);
         register(StcHorseupgradeVo);
         register(StcSpringFirecrackerRewardVo);
         register(StcItemVo);
         register(StcFamilyExpeTaskVo);
         register(StcSwapActionVo);
         register(StcNpcGroupVo);
         register(StcHeroPeiyangVo);
         register(StcBklvIntvlVo);
         register(StcOpenFundVo);
         register(StcMallItemVo);
         register(StcFunctionVo);
         register(StcFamilyTechCostVo);
         register(StcSuperscaleVo);
         register(StcGridNodeVo);
         register(StcStageVo);
         register(StcTimePriceVo);
         register(StcTeambattleRelationVo);
         register(StcYunbiaoVo);
         register(Stc2dSpecialEffectVo);
         register(StcNichengPrefixVo);
         register(StcFamilyStageChapterVo);
         register(StcSkillVo);
         register(StcHeroNodeVo);
         register(StcNvshendianRandomjiangliVo);
         register(StcMilitarygradeVo);
         register(StcSourceRetrivalVo);
         register(StcFamilyBossZuheVo);
         register(StcBaowuFuwenKeyinVo);
         register(StcNewFunctionVo);
         register(StcHeroDescVo);
         register(StcHeropracticeTypeVo);
         register(StcBginfoVo);
         register(StcModelVo);
         register(StcGlobalPriceVo);
         register(StcEquipLiansuoVo);
         register(StcGonghuiZhiweiVo);
         register(StcTaskVo);
         register(StcStageNpcRelationVo);
         register(StcLoadingTipsVo);
         register(StcHeroTalentInfoVo);
         register(StcFamilyStageNodeVo);
         register(StcHorsejingtongVo);
         register(StcGlobalPriceQqVo);
         register(StcHeroSkinSuitVo);
         register(StcGuideVo);
         register(StcBgrankAwardVo);
         register(StcClotheSuitVo);
         register(StcLevelVo);
         register(StcPlatformDefineVo);
         register(StcGeneralCreditsPrizeVo);
         register(StcSigninExtraRewardVo);
         register(StcSysMailVo);
         register(StcPetStarVo);
         register(StcValentineBuyVo);
         register(StcSkillEffectVo);
         register(StcMysticShopVo);
         register(StcShopVo);
         register(StcBgeloIntvlVo);
         register(Stc14DayTaskVo);
         register(StcChargeVo);
         register(StcMinePublicVo);
         register(StcFengcejiangliVo);
         register(StcRecommendHeroVo);
         register(StcPlayerqualityVo);
         register(StcWorldBossZuheVo);
         register(StcLessVo);
         register(StcHeropracticeNanduVo);
         register(StcFacebookInviteRewardVo);
         register(StcAuctionVo);
         register(StcNpcVo);
         register(StcFashionExtraSkillVo);
         register(StcBaowuKeyinVo);
         register(StcGridPageVo);
         register(StcTupoVo);
         register(StcConstellationPageVo);
         register(StcSensitiveWordVo);
         register(StcCrossArenaCheerVo);
         register(StcSaddlehorseVo);
         register(StcVipVo);
         register(StcMengyueVo);
         register(StcConstellationVo);
         register(StcShopFunctionVo);
         register(StcFamilyBossRewardVo);
         register(StcSysNoticeVo);
         register(StcEquipAttrVo);
         register(StcHeroShengjieVo);
         register(StcSigninRewardVo);
         register(StcLotteryVo);
         register(StcRobotVo);
      }
      
      public function getVoByColumnValue(param1:String, param2:String, param3:*) : *
      {
         var _loc5_:DictHash = this.getTabel(param1);
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_.array;
         for each(var _loc4_ in _loc5_.array)
         {
            if(_loc4_[param2] == param3)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function getVoArrByColumnValue(param1:String, param2:String, param3:*) : Array
      {
         var _loc6_:Array = [];
         var _loc5_:DictHash = this.getTabel(param1);
         var _loc8_:int = 0;
         var _loc7_:* = _loc5_.array;
         for each(var _loc4_ in _loc5_.array)
         {
            if(_loc4_[param2] == param3)
            {
               _loc6_.push(_loc4_);
            }
         }
         return _loc6_;
      }
      
      public function getVoByMultiColumnValue(param1:String, param2:Array, param3:Array) : *
      {
         var _loc7_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = undefined;
         var _loc6_:DictHash = this.getTabel(param1);
         var _loc12_:int = 0;
         var _loc11_:* = _loc6_.array;
         do
         {
            for each(var _loc5_ in _loc6_.array)
            {
               _loc7_ = true;
               _loc9_ = param2.length;
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  _loc4_ = param2[_loc10_];
                  _loc8_ = param3[_loc10_];
                  if(_loc5_[_loc4_] != _loc8_)
                  {
                     _loc7_ = false;
                     break;
                  }
                  _loc10_++;
               }
            }
            return null;
         }
         while(!_loc7_);
         
         return _loc5_;
      }
      
      public function getVoArrByMultiColumnValue(param1:String, param2:Array, param3:Array) : Array
      {
         var _loc10_:int = 0;
         var _loc7_:Boolean = false;
         var _loc11_:int = 0;
         var _loc4_:* = null;
         var _loc9_:* = undefined;
         var _loc8_:Array = [];
         var _loc6_:DictHash = this.getTabel(param1);
         var _loc13_:int = 0;
         var _loc12_:* = _loc6_.array;
         for each(var _loc5_ in _loc6_.array)
         {
            _loc10_ = param2.length;
            _loc7_ = true;
            _loc11_ = 0;
            while(_loc11_ < _loc10_)
            {
               _loc4_ = param2[_loc11_];
               _loc9_ = param3[_loc11_];
               if(_loc5_[_loc4_] != _loc9_)
               {
                  _loc7_ = false;
                  break;
               }
               _loc11_++;
            }
            if(_loc7_)
            {
               _loc8_.push(_loc5_);
            }
         }
         return _loc8_;
      }
      
      public function getLanguageTable() : DictHash
      {
         return getTabel("static_language") as DictHash;
      }
      
      public function getLanguageVo(param1:int) : StcLanguageVo
      {
         return getVo("static_language",param1) as StcLanguageVo;
      }
      
      public function getMapTable() : DictHash
      {
         return getTabel("static_map") as DictHash;
      }
      
      public function getMapVo(param1:int) : StcMapVo
      {
         return getVo("static_map",param1) as StcMapVo;
      }
      
      public function getDefineTable() : DictHash
      {
         return getTabel("static_define") as DictHash;
      }
      
      public function getDefineVo(param1:String) : StcDefineVo
      {
         return getVo("static_define",param1) as StcDefineVo;
      }
      
      public function getUiFadeTable() : DictHash
      {
         return getTabel("static_ui_fade") as DictHash;
      }
      
      public function getUiFadeVo(param1:int) : StcUiFadeVo
      {
         return getVo("static_ui_fade",param1) as StcUiFadeVo;
      }
      
      public function getSevendayTaskTable() : DictHash
      {
         return getTabel("static_sevenday_task") as DictHash;
      }
      
      public function getSevendayTaskVo(param1:int) : StcSevendayTaskVo
      {
         return getVo("static_sevenday_task",param1) as StcSevendayTaskVo;
      }
      
      public function getFadeTable() : DictHash
      {
         return getTabel("static_fade") as DictHash;
      }
      
      public function getFadeVo(param1:int) : StcFadeVo
      {
         return getVo("static_fade",param1) as StcFadeVo;
      }
      
      public function getXinshouTipsTable() : DictHash
      {
         return getTabel("static_xinshou_tips") as DictHash;
      }
      
      public function getXinshouTipsVo(param1:int) : StcXinshouTipsVo
      {
         return getVo("static_xinshou_tips",param1) as StcXinshouTipsVo;
      }
      
      public function getBglvIntvlTable() : DictHash
      {
         return getTabel("static_bglv_intvl") as DictHash;
      }
      
      public function getBglvIntvlVo(param1:int) : StcBglvIntvlVo
      {
         return getVo("static_bglv_intvl",param1) as StcBglvIntvlVo;
      }
      
      public function getBuffTable() : DictHash
      {
         return getTabel("static_buff") as DictHash;
      }
      
      public function getBuffVo(param1:int) : StcBuffVo
      {
         return getVo("static_buff",param1) as StcBuffVo;
      }
      
      public function getUiPublishTable() : DictHash
      {
         return getTabel("static_ui_publish") as DictHash;
      }
      
      public function getUiPublishVo(param1:int) : StcUiPublishVo
      {
         return getVo("static_ui_publish",param1) as StcUiPublishVo;
      }
      
      public function getWorldBossTable() : DictHash
      {
         return getTabel("static_world_boss") as DictHash;
      }
      
      public function getWorldBossVo(param1:int) : StcWorldBossVo
      {
         return getVo("static_world_boss",param1) as StcWorldBossVo;
      }
      
      public function getEquipJinglianTable() : DictHash
      {
         return getTabel("static_equip_jinglian") as DictHash;
      }
      
      public function getEquipJinglianVo(param1:int) : StcEquipJinglianVo
      {
         return getVo("static_equip_jinglian",param1) as StcEquipJinglianVo;
      }
      
      public function getSevendayRewardTable() : DictHash
      {
         return getTabel("static_sevenday_reward") as DictHash;
      }
      
      public function getSevendayRewardVo(param1:int) : StcSevendayRewardVo
      {
         return getVo("static_sevenday_reward",param1) as StcSevendayRewardVo;
      }
      
      public function getDropGroupTable() : DictHash
      {
         return getTabel("static_drop_group") as DictHash;
      }
      
      public function getDropGroupVo(param1:int) : StcDropGroupVo
      {
         return getVo("static_drop_group",param1) as StcDropGroupVo;
      }
      
      public function getAuthorityTable() : DictHash
      {
         return getTabel("static_authority") as DictHash;
      }
      
      public function getAuthorityVo(param1:int) : StcAuthorityVo
      {
         return getVo("static_authority",param1) as StcAuthorityVo;
      }
      
      public function getManifestoTable() : DictHash
      {
         return getTabel("static_manifesto") as DictHash;
      }
      
      public function getManifestoVo(param1:int) : StcManifestoVo
      {
         return getVo("static_manifesto",param1) as StcManifestoVo;
      }
      
      public function getHeroTalentTable() : DictHash
      {
         return getTabel("static_hero_talent") as DictHash;
      }
      
      public function getHeroTalentVo(param1:int) : StcHeroTalentVo
      {
         return getVo("static_hero_talent",param1) as StcHeroTalentVo;
      }
      
      public function getHeroPeiyangLimitTable() : DictHash
      {
         return getTabel("static_hero_peiyang_limit") as DictHash;
      }
      
      public function getHeroPeiyangLimitVo(param1:int) : StcHeroPeiyangLimitVo
      {
         return getVo("static_hero_peiyang_limit",param1) as StcHeroPeiyangLimitVo;
      }
      
      public function getEquipSuitTable() : DictHash
      {
         return getTabel("static_equip_suit") as DictHash;
      }
      
      public function getEquipSuitVo(param1:int) : StcEquipSuitVo
      {
         return getVo("static_equip_suit",param1) as StcEquipSuitVo;
      }
      
      public function getCrossArenaMassTable() : DictHash
      {
         return getTabel("static_cross_arena_mass") as DictHash;
      }
      
      public function getCrossArenaMassVo(param1:int) : StcCrossArenaMassVo
      {
         return getVo("static_cross_arena_mass",param1) as StcCrossArenaMassVo;
      }
      
      public function getBgresGatherTable() : DictHash
      {
         return getTabel("static_bgres_gather") as DictHash;
      }
      
      public function getBgresGatherVo(param1:int) : StcBgresGatherVo
      {
         return getVo("static_bgres_gather",param1) as StcBgresGatherVo;
      }
      
      public function getChapterTable() : DictHash
      {
         return getTabel("static_chapter") as DictHash;
      }
      
      public function getChapterVo(param1:int) : StcChapterVo
      {
         return getVo("static_chapter",param1) as StcChapterVo;
      }
      
      public function getGonghuiTable() : DictHash
      {
         return getTabel("static_gonghui") as DictHash;
      }
      
      public function getGonghuiVo(param1:int) : StcGonghuiVo
      {
         return getVo("static_gonghui",param1) as StcGonghuiVo;
      }
      
      public function getGonghuiFlagTable() : DictHash
      {
         return getTabel("static_gonghui_flag") as DictHash;
      }
      
      public function getGonghuiFlagVo(param1:int) : StcGonghuiFlagVo
      {
         return getVo("static_gonghui_flag",param1) as StcGonghuiFlagVo;
      }
      
      public function getCwarTimeTable() : DictHash
      {
         return getTabel("static_cwar_time") as DictHash;
      }
      
      public function getCwarTimeVo(param1:int) : StcCwarTimeVo
      {
         return getVo("static_cwar_time",param1) as StcCwarTimeVo;
      }
      
      public function getNvshendianBuffTable() : DictHash
      {
         return getTabel("static_nvshendian_buff") as DictHash;
      }
      
      public function getNvshendianBuffVo(param1:int) : StcNvshendianBuffVo
      {
         return getVo("static_nvshendian_buff",param1) as StcNvshendianBuffVo;
      }
      
      public function getArenaRankDisplayTable() : DictHash
      {
         return getTabel("static_arena_rank_display") as DictHash;
      }
      
      public function getArenaRankDisplayVo(param1:int) : StcArenaRankDisplayVo
      {
         return getVo("static_arena_rank_display",param1) as StcArenaRankDisplayVo;
      }
      
      public function getFashionSynTable() : DictHash
      {
         return getTabel("static_fashion_syn") as DictHash;
      }
      
      public function getFashionSynVo(param1:int) : StcFashionSynVo
      {
         return getVo("static_fashion_syn",param1) as StcFashionSynVo;
      }
      
      public function getBaowuAttrTable() : DictHash
      {
         return getTabel("static_baowu_attr") as DictHash;
      }
      
      public function getBaowuAttrVo(param1:int) : StcBaowuAttrVo
      {
         return getVo("static_baowu_attr",param1) as StcBaowuAttrVo;
      }
      
      public function getBgtitleIntvlTable() : DictHash
      {
         return getTabel("static_bgtitle_intvl") as DictHash;
      }
      
      public function getBgtitleIntvlVo(param1:int) : StcBgtitleIntvlVo
      {
         return getVo("static_bgtitle_intvl",param1) as StcBgtitleIntvlVo;
      }
      
      public function getFamilyBossTable() : DictHash
      {
         return getTabel("static_family_boss") as DictHash;
      }
      
      public function getFamilyBossVo(param1:int) : StcFamilyBossVo
      {
         return getVo("static_family_boss",param1) as StcFamilyBossVo;
      }
      
      public function getFunctionOpenTipsTable() : DictHash
      {
         return getTabel("static_function_open_tips") as DictHash;
      }
      
      public function getFunctionOpenTipsVo(param1:int) : StcFunctionOpenTipsVo
      {
         return getVo("static_function_open_tips",param1) as StcFunctionOpenTipsVo;
      }
      
      public function getSupportDevelopTable() : DictHash
      {
         return getTabel("static_support_develop") as DictHash;
      }
      
      public function getSupportDevelopVo(param1:int) : StcSupportDevelopVo
      {
         return getVo("static_support_develop",param1) as StcSupportDevelopVo;
      }
      
      public function getGoddessScoreRewardTable() : DictHash
      {
         return getTabel("static_goddess_score_reward") as DictHash;
      }
      
      public function getGoddessScoreRewardVo(param1:int) : StcGoddessScoreRewardVo
      {
         return getVo("static_goddess_score_reward",param1) as StcGoddessScoreRewardVo;
      }
      
      public function getGeneralWelfareTable() : DictHash
      {
         return getTabel("static_general_welfare") as DictHash;
      }
      
      public function getGeneralWelfareVo(param1:int) : StcGeneralWelfareVo
      {
         return getVo("static_general_welfare",param1) as StcGeneralWelfareVo;
      }
      
      public function getRechargeTable() : DictHash
      {
         return getTabel("static_recharge") as DictHash;
      }
      
      public function getRechargeVo(param1:int) : StcRechargeVo
      {
         return getVo("static_recharge",param1) as StcRechargeVo;
      }
      
      public function getMilitaryrankTable() : DictHash
      {
         return getTabel("static_militaryrank") as DictHash;
      }
      
      public function getMilitaryrankVo(param1:int) : StcMilitaryrankVo
      {
         return getVo("static_militaryrank",param1) as StcMilitaryrankVo;
      }
      
      public function getEquipAddStarTable() : DictHash
      {
         return getTabel("static_equip_add_star") as DictHash;
      }
      
      public function getEquipAddStarVo(param1:int) : StcEquipAddStarVo
      {
         return getVo("static_equip_add_star",param1) as StcEquipAddStarVo;
      }
      
      public function getMallActivityTable() : DictHash
      {
         return getTabel("static_mall_activity") as DictHash;
      }
      
      public function getMallActivityVo(param1:int) : StcMallActivityVo
      {
         return getVo("static_mall_activity",param1) as StcMallActivityVo;
      }
      
      public function getSpecialEffectTable() : DictHash
      {
         return getTabel("static_special_effect") as DictHash;
      }
      
      public function getSpecialEffectVo(param1:int) : StcSpecialEffectVo
      {
         return getVo("static_special_effect",param1) as StcSpecialEffectVo;
      }
      
      public function getDropBaseTable() : DictHash
      {
         return getTabel("static_drop_base") as DictHash;
      }
      
      public function getDropBaseVo(param1:int) : StcDropBaseVo
      {
         return getVo("static_drop_base",param1) as StcDropBaseVo;
      }
      
      public function getNichengTable() : DictHash
      {
         return getTabel("static_nicheng") as DictHash;
      }
      
      public function getNichengVo(param1:int) : StcNichengVo
      {
         return getVo("static_nicheng",param1) as StcNichengVo;
      }
      
      public function getBaowuStrengthTable() : DictHash
      {
         return getTabel("static_baowu_strength") as DictHash;
      }
      
      public function getBaowuStrengthVo(param1:int) : StcBaowuStrengthVo
      {
         return getVo("static_baowu_strength",param1) as StcBaowuStrengthVo;
      }
      
      public function getCharmRankBuyTable() : DictHash
      {
         return getTabel("static_charm_rank_buy") as DictHash;
      }
      
      public function getCharmRankBuyVo(param1:int) : StcCharmRankBuyVo
      {
         return getVo("static_charm_rank_buy",param1) as StcCharmRankBuyVo;
      }
      
      public function getGuajiTable() : DictHash
      {
         return getTabel("static_guaji") as DictHash;
      }
      
      public function getGuajiVo(param1:int) : StcGuajiVo
      {
         return getVo("static_guaji",param1) as StcGuajiVo;
      }
      
      public function getEquipStrengthTable() : DictHash
      {
         return getTabel("static_equip_strength") as DictHash;
      }
      
      public function getEquipStrengthVo(param1:int) : StcEquipStrengthVo
      {
         return getVo("static_equip_strength",param1) as StcEquipStrengthVo;
      }
      
      public function getNichengSuffixTable() : DictHash
      {
         return getTabel("static_nicheng_suffix") as DictHash;
      }
      
      public function getNichengSuffixVo(param1:int) : StcNichengSuffixVo
      {
         return getVo("static_nicheng_suffix",param1) as StcNichengSuffixVo;
      }
      
      public function getAssistantLevelTable() : DictHash
      {
         return getTabel("static_assistant_level") as DictHash;
      }
      
      public function getAssistantLevelVo(param1:int) : StcAssistantLevelVo
      {
         return getVo("static_assistant_level",param1) as StcAssistantLevelVo;
      }
      
      public function getRankTable() : DictHash
      {
         return getTabel("static_rank") as DictHash;
      }
      
      public function getRankVo(param1:int) : StcRankVo
      {
         return getVo("static_rank",param1) as StcRankVo;
      }
      
      public function getDefineSpecialTable() : DictHash
      {
         return getTabel("static_define_special") as DictHash;
      }
      
      public function getDefineSpecialVo(param1:String) : StcDefineSpecialVo
      {
         return getVo("static_define_special",param1) as StcDefineSpecialVo;
      }
      
      public function getNvshendianMonsterTable() : DictHash
      {
         return getTabel("static_nvshendian_monster") as DictHash;
      }
      
      public function getNvshendianMonsterVo(param1:int) : StcNvshendianMonsterVo
      {
         return getVo("static_nvshendian_monster",param1) as StcNvshendianMonsterVo;
      }
      
      public function getTitleTable() : DictHash
      {
         return getTabel("static_title") as DictHash;
      }
      
      public function getTitleVo(param1:int) : StcTitleVo
      {
         return getVo("static_title",param1) as StcTitleVo;
      }
      
      public function getGambleTable() : DictHash
      {
         return getTabel("static_gamble") as DictHash;
      }
      
      public function getGambleVo(param1:int) : StcGambleVo
      {
         return getVo("static_gamble",param1) as StcGambleVo;
      }
      
      public function getPetStatusTable() : DictHash
      {
         return getTabel("static_pet_status") as DictHash;
      }
      
      public function getPetStatusVo(param1:int) : StcPetStatusVo
      {
         return getVo("static_pet_status",param1) as StcPetStatusVo;
      }
      
      public function getFacebookFeedTable() : DictHash
      {
         return getTabel("static_facebook_feed") as DictHash;
      }
      
      public function getFacebookFeedVo(param1:int) : StcFacebookFeedVo
      {
         return getVo("static_facebook_feed",param1) as StcFacebookFeedVo;
      }
      
      public function getGrowthTable() : DictHash
      {
         return getTabel("static_growth") as DictHash;
      }
      
      public function getGrowthVo(param1:int) : StcGrowthVo
      {
         return getVo("static_growth",param1) as StcGrowthVo;
      }
      
      public function getCountryIconTable() : DictHash
      {
         return getTabel("static_country_icon") as DictHash;
      }
      
      public function getCountryIconVo(param1:int) : StcCountryIconVo
      {
         return getVo("static_country_icon",param1) as StcCountryIconVo;
      }
      
      public function getEliteStageInvadeTable() : DictHash
      {
         return getTabel("static_elite_stage_invade") as DictHash;
      }
      
      public function getEliteStageInvadeVo(param1:int) : StcEliteStageInvadeVo
      {
         return getVo("static_elite_stage_invade",param1) as StcEliteStageInvadeVo;
      }
      
      public function getUiMornTable() : DictHash
      {
         return getTabel("static_ui_morn") as DictHash;
      }
      
      public function getUiMornVo(param1:int) : StcUiMornVo
      {
         return getVo("static_ui_morn",param1) as StcUiMornVo;
      }
      
      public function getResourceStageTable() : DictHash
      {
         return getTabel("static_resource_stage") as DictHash;
      }
      
      public function getResourceStageVo(param1:int) : StcResourceStageVo
      {
         return getVo("static_resource_stage",param1) as StcResourceStageVo;
      }
      
      public function getHorseupgradeTable() : DictHash
      {
         return getTabel("static_horseupgrade") as DictHash;
      }
      
      public function getHorseupgradeVo(param1:int) : StcHorseupgradeVo
      {
         return getVo("static_horseupgrade",param1) as StcHorseupgradeVo;
      }
      
      public function getSpringFirecrackerRewardTable() : DictHash
      {
         return getTabel("static_spring_firecracker_reward") as DictHash;
      }
      
      public function getSpringFirecrackerRewardVo(param1:int) : StcSpringFirecrackerRewardVo
      {
         return getVo("static_spring_firecracker_reward",param1) as StcSpringFirecrackerRewardVo;
      }
      
      public function getItemTable() : DictHash
      {
         return getTabel("static_item") as DictHash;
      }
      
      public function getItemVo(param1:int) : StcItemVo
      {
         return getVo("static_item",param1) as StcItemVo;
      }
      
      public function getFamilyExpeTaskTable() : DictHash
      {
         return getTabel("static_family_expe_task") as DictHash;
      }
      
      public function getFamilyExpeTaskVo(param1:int) : StcFamilyExpeTaskVo
      {
         return getVo("static_family_expe_task",param1) as StcFamilyExpeTaskVo;
      }
      
      public function getSwapActionTable() : DictHash
      {
         return getTabel("static_swap_action") as DictHash;
      }
      
      public function getSwapActionVo(param1:int) : StcSwapActionVo
      {
         return getVo("static_swap_action",param1) as StcSwapActionVo;
      }
      
      public function getNpcGroupTable() : DictHash
      {
         return getTabel("static_npc_group") as DictHash;
      }
      
      public function getNpcGroupVo(param1:int) : StcNpcGroupVo
      {
         return getVo("static_npc_group",param1) as StcNpcGroupVo;
      }
      
      public function getHeroPeiyangTable() : DictHash
      {
         return getTabel("static_hero_peiyang") as DictHash;
      }
      
      public function getHeroPeiyangVo(param1:int) : StcHeroPeiyangVo
      {
         return getVo("static_hero_peiyang",param1) as StcHeroPeiyangVo;
      }
      
      public function getBklvIntvlTable() : DictHash
      {
         return getTabel("static_bklv_intvl") as DictHash;
      }
      
      public function getBklvIntvlVo(param1:int) : StcBklvIntvlVo
      {
         return getVo("static_bklv_intvl",param1) as StcBklvIntvlVo;
      }
      
      public function getOpenFundTable() : DictHash
      {
         return getTabel("static_open_fund") as DictHash;
      }
      
      public function getOpenFundVo(param1:int) : StcOpenFundVo
      {
         return getVo("static_open_fund",param1) as StcOpenFundVo;
      }
      
      public function getMallItemTable() : DictHash
      {
         return getTabel("static_mall_item") as DictHash;
      }
      
      public function getMallItemVo(param1:int) : StcMallItemVo
      {
         return getVo("static_mall_item",param1) as StcMallItemVo;
      }
      
      public function getFunctionTable() : DictHash
      {
         return getTabel("static_function") as DictHash;
      }
      
      public function getFunctionVo(param1:int) : StcFunctionVo
      {
         return getVo("static_function",param1) as StcFunctionVo;
      }
      
      public function getFamilyTechCostTable() : DictHash
      {
         return getTabel("static_family_tech_cost") as DictHash;
      }
      
      public function getFamilyTechCostVo(param1:int) : StcFamilyTechCostVo
      {
         return getVo("static_family_tech_cost",param1) as StcFamilyTechCostVo;
      }
      
      public function getSuperscaleTable() : DictHash
      {
         return getTabel("static_superscale") as DictHash;
      }
      
      public function getSuperscaleVo(param1:int) : StcSuperscaleVo
      {
         return getVo("static_superscale",param1) as StcSuperscaleVo;
      }
      
      public function getGridNodeTable() : DictHash
      {
         return getTabel("static_grid_node") as DictHash;
      }
      
      public function getGridNodeVo(param1:int) : StcGridNodeVo
      {
         return getVo("static_grid_node",param1) as StcGridNodeVo;
      }
      
      public function getStageTable() : DictHash
      {
         return getTabel("static_stage") as DictHash;
      }
      
      public function getStageVo(param1:int) : StcStageVo
      {
         return getVo("static_stage",param1) as StcStageVo;
      }
      
      public function getTimePriceTable() : DictHash
      {
         return getTabel("static_time_price") as DictHash;
      }
      
      public function getTimePriceVo(param1:int) : StcTimePriceVo
      {
         return getVo("static_time_price",param1) as StcTimePriceVo;
      }
      
      public function getTeambattleRelationTable() : DictHash
      {
         return getTabel("static_teambattle_relation") as DictHash;
      }
      
      public function getTeambattleRelationVo(param1:int) : StcTeambattleRelationVo
      {
         return getVo("static_teambattle_relation",param1) as StcTeambattleRelationVo;
      }
      
      public function getYunbiaoTable() : DictHash
      {
         return getTabel("static_yunbiao") as DictHash;
      }
      
      public function getYunbiaoVo(param1:int) : StcYunbiaoVo
      {
         return getVo("static_yunbiao",param1) as StcYunbiaoVo;
      }
      
      public function get2dSpecialEffectTable() : DictHash
      {
         return getTabel("static_2d_special_effect") as DictHash;
      }
      
      public function get2dSpecialEffectVo(param1:int) : Stc2dSpecialEffectVo
      {
         return getVo("static_2d_special_effect",param1) as Stc2dSpecialEffectVo;
      }
      
      public function getNichengPrefixTable() : DictHash
      {
         return getTabel("static_nicheng_prefix") as DictHash;
      }
      
      public function getNichengPrefixVo(param1:int) : StcNichengPrefixVo
      {
         return getVo("static_nicheng_prefix",param1) as StcNichengPrefixVo;
      }
      
      public function getFamilyStageChapterTable() : DictHash
      {
         return getTabel("static_family_stage_chapter") as DictHash;
      }
      
      public function getFamilyStageChapterVo(param1:int) : StcFamilyStageChapterVo
      {
         return getVo("static_family_stage_chapter",param1) as StcFamilyStageChapterVo;
      }
      
      public function getSkillTable() : DictHash
      {
         return getTabel("static_skill") as DictHash;
      }
      
      public function getSkillVo(param1:int) : StcSkillVo
      {
         return getVo("static_skill",param1) as StcSkillVo;
      }
      
      public function getHeroNodeTable() : DictHash
      {
         return getTabel("static_hero_node") as DictHash;
      }
      
      public function getHeroNodeVo(param1:int) : StcHeroNodeVo
      {
         return getVo("static_hero_node",param1) as StcHeroNodeVo;
      }
      
      public function getNvshendianRandomjiangliTable() : DictHash
      {
         return getTabel("static_nvshendian_randomjiangli") as DictHash;
      }
      
      public function getNvshendianRandomjiangliVo(param1:int) : StcNvshendianRandomjiangliVo
      {
         return getVo("static_nvshendian_randomjiangli",param1) as StcNvshendianRandomjiangliVo;
      }
      
      public function getMilitarygradeTable() : DictHash
      {
         return getTabel("static_militarygrade") as DictHash;
      }
      
      public function getMilitarygradeVo(param1:int) : StcMilitarygradeVo
      {
         return getVo("static_militarygrade",param1) as StcMilitarygradeVo;
      }
      
      public function getSourceRetrivalTable() : DictHash
      {
         return getTabel("static_source_retrival") as DictHash;
      }
      
      public function getSourceRetrivalVo(param1:int) : StcSourceRetrivalVo
      {
         return getVo("static_source_retrival",param1) as StcSourceRetrivalVo;
      }
      
      public function getFamilyBossZuheTable() : DictHash
      {
         return getTabel("static_family_boss_zuhe") as DictHash;
      }
      
      public function getFamilyBossZuheVo(param1:int) : StcFamilyBossZuheVo
      {
         return getVo("static_family_boss_zuhe",param1) as StcFamilyBossZuheVo;
      }
      
      public function getBaowuFuwenKeyinTable() : DictHash
      {
         return getTabel("static_baowu_fuwen_keyin") as DictHash;
      }
      
      public function getBaowuFuwenKeyinVo(param1:int) : StcBaowuFuwenKeyinVo
      {
         return getVo("static_baowu_fuwen_keyin",param1) as StcBaowuFuwenKeyinVo;
      }
      
      public function getNewFunctionTable() : DictHash
      {
         return getTabel("static_new_function") as DictHash;
      }
      
      public function getNewFunctionVo(param1:int) : StcNewFunctionVo
      {
         return getVo("static_new_function",param1) as StcNewFunctionVo;
      }
      
      public function getHeroDescTable() : DictHash
      {
         return getTabel("static_hero_desc") as DictHash;
      }
      
      public function getHeroDescVo(param1:int) : StcHeroDescVo
      {
         return getVo("static_hero_desc",param1) as StcHeroDescVo;
      }
      
      public function getHeropracticeTypeTable() : DictHash
      {
         return getTabel("static_heropractice_type") as DictHash;
      }
      
      public function getHeropracticeTypeVo(param1:int) : StcHeropracticeTypeVo
      {
         return getVo("static_heropractice_type",param1) as StcHeropracticeTypeVo;
      }
      
      public function getBginfoTable() : DictHash
      {
         return getTabel("static_bginfo") as DictHash;
      }
      
      public function getBginfoVo(param1:int) : StcBginfoVo
      {
         return getVo("static_bginfo",param1) as StcBginfoVo;
      }
      
      public function getModelTable() : DictHash
      {
         return getTabel("static_model") as DictHash;
      }
      
      public function getModelVo(param1:int) : StcModelVo
      {
         return getVo("static_model",param1) as StcModelVo;
      }
      
      public function getGlobalPriceTable() : DictHash
      {
         return getTabel("static_global_price") as DictHash;
      }
      
      public function getGlobalPriceVo(param1:int) : StcGlobalPriceVo
      {
         return getVo("static_global_price",param1) as StcGlobalPriceVo;
      }
      
      public function getEquipLiansuoTable() : DictHash
      {
         return getTabel("static_equip_liansuo") as DictHash;
      }
      
      public function getEquipLiansuoVo(param1:int) : StcEquipLiansuoVo
      {
         return getVo("static_equip_liansuo",param1) as StcEquipLiansuoVo;
      }
      
      public function getGonghuiZhiweiTable() : DictHash
      {
         return getTabel("static_gonghui_zhiwei") as DictHash;
      }
      
      public function getGonghuiZhiweiVo(param1:int) : StcGonghuiZhiweiVo
      {
         return getVo("static_gonghui_zhiwei",param1) as StcGonghuiZhiweiVo;
      }
      
      public function getTaskTable() : DictHash
      {
         return getTabel("static_task") as DictHash;
      }
      
      public function getTaskVo(param1:int) : StcTaskVo
      {
         return getVo("static_task",param1) as StcTaskVo;
      }
      
      public function getStageNpcRelationTable() : DictHash
      {
         return getTabel("static_stage_npc_relation") as DictHash;
      }
      
      public function getStageNpcRelationVo(param1:int) : StcStageNpcRelationVo
      {
         return getVo("static_stage_npc_relation",param1) as StcStageNpcRelationVo;
      }
      
      public function getLoadingTipsTable() : DictHash
      {
         return getTabel("static_loading_tips") as DictHash;
      }
      
      public function getLoadingTipsVo(param1:int) : StcLoadingTipsVo
      {
         return getVo("static_loading_tips",param1) as StcLoadingTipsVo;
      }
      
      public function getHeroTalentInfoTable() : DictHash
      {
         return getTabel("static_hero_talent_info") as DictHash;
      }
      
      public function getHeroTalentInfoVo(param1:int) : StcHeroTalentInfoVo
      {
         return getVo("static_hero_talent_info",param1) as StcHeroTalentInfoVo;
      }
      
      public function getFamilyStageNodeTable() : DictHash
      {
         return getTabel("static_family_stage_node") as DictHash;
      }
      
      public function getFamilyStageNodeVo(param1:int) : StcFamilyStageNodeVo
      {
         return getVo("static_family_stage_node",param1) as StcFamilyStageNodeVo;
      }
      
      public function getHorsejingtongTable() : DictHash
      {
         return getTabel("static_horsejingtong") as DictHash;
      }
      
      public function getHorsejingtongVo(param1:int) : StcHorsejingtongVo
      {
         return getVo("static_horsejingtong",param1) as StcHorsejingtongVo;
      }
      
      public function getGlobalPriceQqTable() : DictHash
      {
         return getTabel("static_global_price_qq") as DictHash;
      }
      
      public function getGlobalPriceQqVo(param1:int) : StcGlobalPriceQqVo
      {
         return getVo("static_global_price_qq",param1) as StcGlobalPriceQqVo;
      }
      
      public function getHeroSkinSuitTable() : DictHash
      {
         return getTabel("static_hero_skin_suit") as DictHash;
      }
      
      public function getHeroSkinSuitVo(param1:int) : StcHeroSkinSuitVo
      {
         return getVo("static_hero_skin_suit",param1) as StcHeroSkinSuitVo;
      }
      
      public function getGuideTable() : DictHash
      {
         return getTabel("static_guide") as DictHash;
      }
      
      public function getGuideVo(param1:int) : StcGuideVo
      {
         return getVo("static_guide",param1) as StcGuideVo;
      }
      
      public function getBgrankAwardTable() : DictHash
      {
         return getTabel("static_bgrank_award") as DictHash;
      }
      
      public function getBgrankAwardVo(param1:int) : StcBgrankAwardVo
      {
         return getVo("static_bgrank_award",param1) as StcBgrankAwardVo;
      }
      
      public function getClotheSuitTable() : DictHash
      {
         return getTabel("static_clothe_suit") as DictHash;
      }
      
      public function getClotheSuitVo(param1:int) : StcClotheSuitVo
      {
         return getVo("static_clothe_suit",param1) as StcClotheSuitVo;
      }
      
      public function getLevelTable() : DictHash
      {
         return getTabel("static_level") as DictHash;
      }
      
      public function getLevelVo(param1:int) : StcLevelVo
      {
         return getVo("static_level",param1) as StcLevelVo;
      }
      
      public function getPlatformDefineTable() : DictHash
      {
         return getTabel("static_platform_define") as DictHash;
      }
      
      public function getPlatformDefineVo(param1:String) : StcPlatformDefineVo
      {
         return getVo("static_platform_define",param1) as StcPlatformDefineVo;
      }
      
      public function getGeneralCreditsPrizeTable() : DictHash
      {
         return getTabel("static_general_credits_prize") as DictHash;
      }
      
      public function getGeneralCreditsPrizeVo(param1:int) : StcGeneralCreditsPrizeVo
      {
         return getVo("static_general_credits_prize",param1) as StcGeneralCreditsPrizeVo;
      }
      
      public function getSigninExtraRewardTable() : DictHash
      {
         return getTabel("static_signin_extra_reward") as DictHash;
      }
      
      public function getSigninExtraRewardVo(param1:int) : StcSigninExtraRewardVo
      {
         return getVo("static_signin_extra_reward",param1) as StcSigninExtraRewardVo;
      }
      
      public function getSysMailTable() : DictHash
      {
         return getTabel("static_sys_mail") as DictHash;
      }
      
      public function getSysMailVo(param1:int) : StcSysMailVo
      {
         return getVo("static_sys_mail",param1) as StcSysMailVo;
      }
      
      public function getPetStarTable() : DictHash
      {
         return getTabel("static_pet_star") as DictHash;
      }
      
      public function getPetStarVo(param1:int) : StcPetStarVo
      {
         return getVo("static_pet_star",param1) as StcPetStarVo;
      }
      
      public function getValentineBuyTable() : DictHash
      {
         return getTabel("static_valentine_buy") as DictHash;
      }
      
      public function getValentineBuyVo(param1:int) : StcValentineBuyVo
      {
         return getVo("static_valentine_buy",param1) as StcValentineBuyVo;
      }
      
      public function getSkillEffectTable() : DictHash
      {
         return getTabel("static_skill_effect") as DictHash;
      }
      
      public function getSkillEffectVo(param1:int) : StcSkillEffectVo
      {
         return getVo("static_skill_effect",param1) as StcSkillEffectVo;
      }
      
      public function getMysticShopTable() : DictHash
      {
         return getTabel("static_mystic_shop") as DictHash;
      }
      
      public function getMysticShopVo(param1:int) : StcMysticShopVo
      {
         return getVo("static_mystic_shop",param1) as StcMysticShopVo;
      }
      
      public function getShopTable() : DictHash
      {
         return getTabel("static_shop") as DictHash;
      }
      
      public function getShopVo(param1:int) : StcShopVo
      {
         return getVo("static_shop",param1) as StcShopVo;
      }
      
      public function getBgeloIntvlTable() : DictHash
      {
         return getTabel("static_bgelo_intvl") as DictHash;
      }
      
      public function getBgeloIntvlVo(param1:int) : StcBgeloIntvlVo
      {
         return getVo("static_bgelo_intvl",param1) as StcBgeloIntvlVo;
      }
      
      public function get14DayTaskTable() : DictHash
      {
         return getTabel("static_14_day_task") as DictHash;
      }
      
      public function get14DayTaskVo(param1:int) : Stc14DayTaskVo
      {
         return getVo("static_14_day_task",param1) as Stc14DayTaskVo;
      }
      
      public function getChargeTable() : DictHash
      {
         return getTabel("static_charge") as DictHash;
      }
      
      public function getChargeVo(param1:int) : StcChargeVo
      {
         return getVo("static_charge",param1) as StcChargeVo;
      }
      
      public function getMinePublicTable() : DictHash
      {
         return getTabel("static_mine_public") as DictHash;
      }
      
      public function getMinePublicVo(param1:int) : StcMinePublicVo
      {
         return getVo("static_mine_public",param1) as StcMinePublicVo;
      }
      
      public function getFengcejiangliTable() : DictHash
      {
         return getTabel("static_fengcejiangli") as DictHash;
      }
      
      public function getFengcejiangliVo(param1:String) : StcFengcejiangliVo
      {
         return getVo("static_fengcejiangli",param1) as StcFengcejiangliVo;
      }
      
      public function getRecommendHeroTable() : DictHash
      {
         return getTabel("static_recommend_hero") as DictHash;
      }
      
      public function getRecommendHeroVo(param1:int) : StcRecommendHeroVo
      {
         return getVo("static_recommend_hero",param1) as StcRecommendHeroVo;
      }
      
      public function getPlayerqualityTable() : DictHash
      {
         return getTabel("static_playerquality") as DictHash;
      }
      
      public function getPlayerqualityVo(param1:int) : StcPlayerqualityVo
      {
         return getVo("static_playerquality",param1) as StcPlayerqualityVo;
      }
      
      public function getWorldBossZuheTable() : DictHash
      {
         return getTabel("static_world_boss_zuhe") as DictHash;
      }
      
      public function getWorldBossZuheVo(param1:int) : StcWorldBossZuheVo
      {
         return getVo("static_world_boss_zuhe",param1) as StcWorldBossZuheVo;
      }
      
      public function getLessTable() : DictHash
      {
         return getTabel("static_less") as DictHash;
      }
      
      public function getLessVo(param1:int) : StcLessVo
      {
         return getVo("static_less",param1) as StcLessVo;
      }
      
      public function getHeropracticeNanduTable() : DictHash
      {
         return getTabel("static_heropractice_nandu") as DictHash;
      }
      
      public function getHeropracticeNanduVo(param1:int) : StcHeropracticeNanduVo
      {
         return getVo("static_heropractice_nandu",param1) as StcHeropracticeNanduVo;
      }
      
      public function getFacebookInviteRewardTable() : DictHash
      {
         return getTabel("static_facebook_invite_reward") as DictHash;
      }
      
      public function getFacebookInviteRewardVo(param1:int) : StcFacebookInviteRewardVo
      {
         return getVo("static_facebook_invite_reward",param1) as StcFacebookInviteRewardVo;
      }
      
      public function getAuctionTable() : DictHash
      {
         return getTabel("static_auction") as DictHash;
      }
      
      public function getAuctionVo(param1:int) : StcAuctionVo
      {
         return getVo("static_auction",param1) as StcAuctionVo;
      }
      
      public function getNpcTable() : DictHash
      {
         return getTabel("static_npc") as DictHash;
      }
      
      public function getNpcVo(param1:int) : StcNpcVo
      {
         return getVo("static_npc",param1) as StcNpcVo;
      }
      
      public function getFashionExtraSkillTable() : DictHash
      {
         return getTabel("static_fashion_extra_skill") as DictHash;
      }
      
      public function getFashionExtraSkillVo(param1:int) : StcFashionExtraSkillVo
      {
         return getVo("static_fashion_extra_skill",param1) as StcFashionExtraSkillVo;
      }
      
      public function getBaowuKeyinTable() : DictHash
      {
         return getTabel("static_baowu_keyin") as DictHash;
      }
      
      public function getBaowuKeyinVo(param1:int) : StcBaowuKeyinVo
      {
         return getVo("static_baowu_keyin",param1) as StcBaowuKeyinVo;
      }
      
      public function getGridPageTable() : DictHash
      {
         return getTabel("static_grid_page") as DictHash;
      }
      
      public function getGridPageVo(param1:int) : StcGridPageVo
      {
         return getVo("static_grid_page",param1) as StcGridPageVo;
      }
      
      public function getTupoTable() : DictHash
      {
         return getTabel("static_tupo") as DictHash;
      }
      
      public function getTupoVo(param1:int) : StcTupoVo
      {
         return getVo("static_tupo",param1) as StcTupoVo;
      }
      
      public function getConstellationPageTable() : DictHash
      {
         return getTabel("static_constellation_page") as DictHash;
      }
      
      public function getConstellationPageVo(param1:int) : StcConstellationPageVo
      {
         return getVo("static_constellation_page",param1) as StcConstellationPageVo;
      }
      
      public function getSensitiveWordTable() : DictHash
      {
         return getTabel("static_sensitive_word") as DictHash;
      }
      
      public function getSensitiveWordVo(param1:int) : StcSensitiveWordVo
      {
         return getVo("static_sensitive_word",param1) as StcSensitiveWordVo;
      }
      
      public function getCrossArenaCheerTable() : DictHash
      {
         return getTabel("static_cross_arena_cheer") as DictHash;
      }
      
      public function getCrossArenaCheerVo(param1:int) : StcCrossArenaCheerVo
      {
         return getVo("static_cross_arena_cheer",param1) as StcCrossArenaCheerVo;
      }
      
      public function getSaddlehorseTable() : DictHash
      {
         return getTabel("static_saddlehorse") as DictHash;
      }
      
      public function getSaddlehorseVo(param1:int) : StcSaddlehorseVo
      {
         return getVo("static_saddlehorse",param1) as StcSaddlehorseVo;
      }
      
      public function getVipTable() : DictHash
      {
         return getTabel("static_vip") as DictHash;
      }
      
      public function getVipVo(param1:int) : StcVipVo
      {
         return getVo("static_vip",param1) as StcVipVo;
      }
      
      public function getMengyueTable() : DictHash
      {
         return getTabel("static_mengyue") as DictHash;
      }
      
      public function getMengyueVo(param1:int) : StcMengyueVo
      {
         return getVo("static_mengyue",param1) as StcMengyueVo;
      }
      
      public function getConstellationTable() : DictHash
      {
         return getTabel("static_constellation") as DictHash;
      }
      
      public function getConstellationVo(param1:int) : StcConstellationVo
      {
         return getVo("static_constellation",param1) as StcConstellationVo;
      }
      
      public function getShopFunctionTable() : DictHash
      {
         return getTabel("static_shop_function") as DictHash;
      }
      
      public function getShopFunctionVo(param1:int) : StcShopFunctionVo
      {
         return getVo("static_shop_function",param1) as StcShopFunctionVo;
      }
      
      public function getFamilyBossRewardTable() : DictHash
      {
         return getTabel("static_family_boss_reward") as DictHash;
      }
      
      public function getFamilyBossRewardVo(param1:int) : StcFamilyBossRewardVo
      {
         return getVo("static_family_boss_reward",param1) as StcFamilyBossRewardVo;
      }
      
      public function getSysNoticeTable() : DictHash
      {
         return getTabel("static_sys_notice") as DictHash;
      }
      
      public function getSysNoticeVo(param1:int) : StcSysNoticeVo
      {
         return getVo("static_sys_notice",param1) as StcSysNoticeVo;
      }
      
      public function getEquipAttrTable() : DictHash
      {
         return getTabel("static_equip_attr") as DictHash;
      }
      
      public function getEquipAttrVo(param1:int) : StcEquipAttrVo
      {
         return getVo("static_equip_attr",param1) as StcEquipAttrVo;
      }
      
      public function getHeroShengjieTable() : DictHash
      {
         return getTabel("static_hero_shengjie") as DictHash;
      }
      
      public function getHeroShengjieVo(param1:int) : StcHeroShengjieVo
      {
         return getVo("static_hero_shengjie",param1) as StcHeroShengjieVo;
      }
      
      public function getSigninRewardTable() : DictHash
      {
         return getTabel("static_signin_reward") as DictHash;
      }
      
      public function getSigninRewardVo(param1:int) : StcSigninRewardVo
      {
         return getVo("static_signin_reward",param1) as StcSigninRewardVo;
      }
      
      public function getLotteryTable() : DictHash
      {
         return getTabel("static_lottery") as DictHash;
      }
      
      public function getLotteryVo(param1:int) : StcLotteryVo
      {
         return getVo("static_lottery",param1) as StcLotteryVo;
      }
      
      public function getRobotTable() : DictHash
      {
         return getTabel("static_robot") as DictHash;
      }
      
      public function getRobotVo(param1:int) : StcRobotVo
      {
         return getVo("static_robot",param1) as StcRobotVo;
      }
   }
}
