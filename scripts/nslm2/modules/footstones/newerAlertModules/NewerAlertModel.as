package nslm2.modules.footstones.newerAlertModules
{
   import com.mz.core.utils.DictHash;
   import com.mz.core.utils.ArrayUtil;
   import proto.HeroInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchNewerAlertMsg;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import proto.GuajiInfoRes;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianMonsterVo;
   import nslm2.utils.ServerTimer;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import proto.HeroBaseInfo;
   import nslm2.common.vo.WealthVo;
   
   public class NewerAlertModel
   {
      
      private static var _ins:nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
       
      
      public var alertNewerGuideArr:Array;
      
      public var funcNewerIdDict:DictHash;
      
      public var funcIdShowLevelDict:DictHash;
      
      public var isAutoAddExping:Boolean;
      
      public var canShowNewerAlert:Boolean;
      
      public var canShowNewerTupoAlert:Boolean = true;
      
      public var nextCanShowStampDict:DictHash;
      
      public function NewerAlertModel()
      {
         alertNewerGuideArr = [];
         super();
         funcNewerIdDict = new DictHash();
         funcNewerIdDict.put(30110,99189);
         funcIdShowLevelDict = new DictHash();
         funcIdShowLevelDict.put(30110,15);
         funcIdShowLevelDict.put(20010,20);
         nextCanShowStampDict = new DictHash();
      }
      
      public static function get ins() : nslm2.modules.footstones.newerAlertModules.NewerAlertModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.newerAlertModules.NewerAlertModel();
         }
         return _ins;
      }
      
      public function addNewerGuideIdByFunId(param1:int) : void
      {
         var _loc2_:int = funcNewerIdDict.getValue(param1);
         if(_loc2_ != 0)
         {
            alertNewerGuideArr.push(_loc2_);
         }
      }
      
      public function removeNewerGuideIdByFunId(param1:int) : void
      {
         var _loc2_:int = funcNewerIdDict.getValue(param1);
         if(_loc2_ != 0)
         {
            ArrayUtil.removeItem(alertNewerGuideArr,_loc2_);
         }
      }
      
      public function checkCanTupo() : Boolean
      {
         if(checkInLevel(30110) == false)
         {
            return false;
         }
         var _loc1_:HeroInfo = getCanTupoHero();
         if(_loc1_)
         {
            ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(30110,true));
            return true;
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(30110,false));
         return false;
      }
      
      public function checkFightValueUp() : void
      {
         if(PlayerModel.ins.level <= 30)
         {
            if(checkNewEliteDungeonFightValue() == false)
            {
               if(checkGuajiFightValue() == false)
               {
                  checkShenYuanFightValue();
               }
            }
         }
      }
      
      public function checkNewEliteDungeonFightValue() : Boolean
      {
         var _loc1_:* = null;
         if(checkTimeCanShow(40408) == false || FuncOpenAutoCtrl.checkOpen(40408) == false)
         {
            return false;
         }
         var _loc3_:int = ChapterModel.ins.nextStageIdDic.getValue(2);
         var _loc2_:StcStageVo = StcMgr.ins.getStageVo(_loc3_);
         if(_loc2_)
         {
            if(ChapterModel.ins.canEnterStage(_loc2_.id,false,false) == true)
            {
               _loc1_ = StcMgr.ins.getNpcGroupVo(_loc2_.lastGroupId);
               if(PlayerModel.ins.totalFightValue >= _loc1_.battle_power)
               {
                  ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(40408,true));
                  return true;
               }
            }
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(40408,false));
         return false;
      }
      
      public function checkGuajiFightValue() : Boolean
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         if(checkTimeCanShow(41210) == false || FuncOpenAutoCtrl.checkOpen(41210) == false)
         {
            return false;
         }
         var _loc2_:GuajiInfoRes = TeamGuajiService.ins.sceneInfo;
         if(_loc2_ && _loc2_.curGuajiId && _loc2_.curGuajiId != 108)
         {
            _loc3_ = StcMgr.ins.getGuajiVo(_loc2_.curGuajiId);
            _loc1_ = StcMgr.ins.getNpcGroupVo(_loc3_.boss_group_id);
            if(_loc1_ && PlayerModel.ins.level >= _loc3_.boss_lv_limit && PlayerModel.ins.totalFightValue >= _loc1_.battle_power)
            {
               ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(41210,true));
               return true;
            }
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(41210,false));
         return false;
      }
      
      public function checkShenYuanFightValue() : Boolean
      {
         var _loc1_:* = null;
         if(checkTimeCanShow(41500) == false || FuncOpenAutoCtrl.checkOpen(41500) == false)
         {
            return false;
         }
         if(ShenYuanModel.ins.crtMonsterData.length > 0 && ShenYuanModel.ins.canPass == false)
         {
            _loc1_ = StcMgr.ins.getNvshendianMonsterVo(ShenYuanModel.ins.crtFloor * 10 + 3);
            if(_loc1_ && PlayerModel.ins.totalFightValue >= _loc1_.btlpower)
            {
               ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(41500,true));
               return true;
            }
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",new SwitchNewerAlertMsg(41500,false));
         return false;
      }
      
      public function checkTimeCanShow(param1:int) : Boolean
      {
         var _loc2_:int = nextCanShowStampDict.getValue(param1);
         if(_loc2_ == 0 || ServerTimer.ins.second >= _loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function getCanTupoHero() : HeroInfo
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:Array = HeroModel.ins.teamHeroInfoArr;
         _loc6_ = 0;
         loop0:
         while(_loc6_ < _loc1_.length)
         {
            _loc5_ = RoleTupoUtil.getNeedGodhoodArr(StcMgr.ins.getTupoVo(_loc1_[_loc6_].baseInfo.baseId));
            _loc4_ = _loc1_[_loc6_].baseInfo.tupoItem;
            _loc3_ = _loc4_.length;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               if(!(_loc4_[_loc2_] == 0 && (PlayerModel.ins.getCountByWealthVo(_loc5_[_loc2_]) < _loc5_[_loc2_].count || (_loc1_[_loc6_].baseInfo as HeroBaseInfo).level < (_loc5_[_loc2_] as WealthVo).stcItemVo.need_level)))
               {
                  _loc2_++;
                  continue;
               }
               _loc6_++;
               continue loop0;
            }
            return _loc1_[_loc6_];
         }
         return null;
      }
      
      public function checkInLevel(param1:int) : Boolean
      {
         var _loc2_:int = funcIdShowLevelDict.getValue(param1);
         if(_loc2_)
         {
            return PlayerModel.ins.level < _loc2_;
         }
         return true;
      }
   }
}
