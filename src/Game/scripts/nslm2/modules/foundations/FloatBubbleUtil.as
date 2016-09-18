package nslm2.modules.foundations
{
   import com.mz.core.utils.DictHash;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.cultivates.roleTeam.util.RoleTeamUtil;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcXinshouTipsVo;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.setting.service.SettingService;
   
   public class FloatBubbleUtil
   {
      
      private static var _showDict:DictHash;
      
      private static var _voDict:DictHash;
      
      private static var _isInNewGuide:Boolean;
      
      private static var _isUnlock:Boolean = true;
      
      private static var _lastShowingTypeId:int;
      
      private static var history:Object;
      
      public static const XINSHOUTIPS:String = "xinshouTips";
       
      
      public function FloatBubbleUtil()
      {
         super();
      }
      
      private static function get showDict() : DictHash
      {
         if(_showDict == null)
         {
            initShowDict();
         }
         return _showDict;
      }
      
      private static function get voDict() : DictHash
      {
         if(_voDict == null)
         {
            initShowDict();
         }
         return _voDict;
      }
      
      public static function changeShow(param1:int, param2:Boolean) : void
      {
         showDict.put(param1,param2);
         checkShow();
      }
      
      public static function initCheck() : void
      {
         checkEquipNotStrengthed();
         checkTreasureNotStrengthed();
      }
      
      public static function checkEquipNotStrengthed() : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(checkInLevel(4) == false)
         {
            return;
         }
         var _loc3_:Array = HeroModel.ins.teamHeroInfoArr;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc6_];
            _loc2_ = RoleTeamUtil.toEquipVoArr(_loc4_.items,0,_loc4_.baseInfo.baseId);
            var _loc8_:int = 0;
            var _loc7_:* = _loc2_;
            for each(var _loc1_ in _loc2_)
            {
               if(_loc1_.wealthVo)
               {
                  _loc5_ = StcMgr.ins.getEquipStrengthVo(_loc1_.wealthVo.item.strengthId);
                  if(_loc5_ && _loc5_.level == 0)
                  {
                     changeShow(4,true);
                     return;
                  }
               }
            }
            _loc6_++;
         }
         changeShow(4,false);
      }
      
      public static function checkTreasureNotStrengthed() : void
      {
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         if(checkInLevel(6) == false)
         {
            return;
         }
         var _loc4_:Array = HeroModel.ins.teamHeroInfoArr;
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc5_ = _loc4_[_loc6_];
            _loc2_ = RoleTeamUtil.toEquipBaoWuVoArr(_loc5_.baowu,0,_loc5_.baseInfo.baseId);
            var _loc8_:int = 0;
            var _loc7_:* = _loc2_;
            for each(var _loc1_ in _loc2_)
            {
               if(_loc1_.wealthVo && _loc1_.wealthVo.treasure.level > 0)
               {
                  if(TreasureModel.ins.hasBetterTreasure(_loc1_.wealthVo))
                  {
                     changeShow(6,false);
                     return;
                  }
               }
            }
            _loc6_++;
         }
         var _loc10_:int = 0;
         var _loc9_:* = BagModel.ins.toWealthVoArr;
         for each(var _loc3_ in BagModel.ins.toWealthVoArr)
         {
            if(_loc3_.kind == 31 || _loc3_.kind == 8 || _loc3_.kind == 9)
            {
               changeShow(6,true);
               return;
            }
         }
      }
      
      public static function get lastShowingTypeId() : int
      {
         return _lastShowingTypeId;
      }
      
      public static function checkShow() : void
      {
         var _loc1_:int = 0;
         if(_isInNewGuide == true)
         {
            _lastShowingTypeId = 0;
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_BUBBLE_ALERT",0);
            return;
         }
         _loc1_ = 0;
         while(_loc1_ < FloatBubbleType.SORT_ARR.length)
         {
            if(showDict.getValue(FloatBubbleType.SORT_ARR[_loc1_]) == true && checkInLevel(FloatBubbleType.SORT_ARR[_loc1_]) == true)
            {
               if(FloatBubbleType.SORT_ARR[_loc1_] != _lastShowingTypeId)
               {
                  if(FloatBubbleType.SORT_ARR[_loc1_] != 2 || FloatBubbleType.SORT_ARR[_loc1_] == 2 && _isUnlock != false)
                  {
                     _lastShowingTypeId = FloatBubbleType.SORT_ARR[_loc1_];
                     ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_BUBBLE_ALERT",_lastShowingTypeId);
                     return;
                  }
               }
               else
               {
                  return;
               }
            }
            _loc1_++;
         }
         _lastShowingTypeId = 0;
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_BUBBLE_ALERT",0);
      }
      
      public static function showOrHideBubble(param1:Boolean, param2:Boolean) : void
      {
         _isInNewGuide = !param1;
         _isUnlock = param2;
         if(_isInNewGuide == true)
         {
            TweenLite.killDelayedCallsTo(checkShow);
            checkShow();
         }
         else
         {
            TweenLite.killDelayedCallsTo(checkShow);
            TweenLite.delayedCall(2,checkShow);
         }
      }
      
      public static function getDescribeString(param1:int) : String
      {
         var _loc2_:int = (voDict.getValue(param1) as FloatBubbleVo).languageId;
         if(_loc2_ != 0)
         {
            return LocaleMgr.ins.getStr(_loc2_);
         }
         return "";
      }
      
      public static function checkCanTupo() : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(checkInLevel(1) == false)
         {
            return;
         }
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
               if(!(_loc4_[_loc2_] == 0 && PlayerModel.ins.getCountByWealthVo(_loc5_[_loc2_]) < _loc5_[_loc2_].count))
               {
                  _loc2_++;
                  continue;
               }
               _loc6_++;
               continue loop0;
            }
            ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",true);
            return;
         }
         ObserverMgr.ins.sendNotice("msgSwitchNewerAlert",false);
      }
      
      public static function checkInLevel(param1:int) : Boolean
      {
         var _loc2_:FloatBubbleVo = voDict.getValue(param1);
         return PlayerModel.ins.level >= _loc2_.leastShowLevel && PlayerModel.ins.level <= _loc2_.maxShowLevel;
      }
      
      public static function initShowDict() : void
      {
         var _loc1_:int = 0;
         _showDict = new DictHash();
         _loc1_ = 0;
         while(_loc1_ < FloatBubbleType.SORT_ARR.length)
         {
            _showDict.put(FloatBubbleType.SORT_ARR[_loc1_],false);
            _loc1_++;
         }
         _voDict = new DictHash();
         _voDict.put(1,new FloatBubbleVo(1,30701,5,14,40740223));
         _voDict.put(2,new FloatBubbleVo(2,10420,5,10,40740221));
         _voDict.put(3,new FloatBubbleVo(3,30810,15,24,96200200));
         _voDict.put(4,new FloatBubbleVo(4,30500,15,20,96200201));
         _voDict.put(5,new FloatBubbleVo(5,30810,25,30,96200202));
         _voDict.put(6,new FloatBubbleVo(6,30600,25,30,96200203));
      }
      
      public static function getVo(param1:int) : FloatBubbleVo
      {
         return voDict.getValue(param1);
      }
      
      public static function needShow(param1:int) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:StcXinshouTipsVo = StcMgr.ins.getXinshouTipsVo(param1);
         if(_loc3_)
         {
            if(StringUtils.isNull(_loc3_.level) == false)
            {
               _loc6_ = _loc3_.level.split(":");
               _loc4_ = _loc6_[0];
               _loc5_ = _loc6_[1];
               if(PlayerModel.ins.level >= _loc4_ && PlayerModel.ins.level <= _loc5_)
               {
                  _loc7_ = true;
               }
            }
            else
            {
               _loc7_ = true;
            }
            if(_loc3_.num != 0)
            {
               _loc8_ = getDoneTimes(param1.toString());
               if(_loc8_ >= _loc3_.num)
               {
                  _loc2_ = false;
               }
               else
               {
                  _loc2_ = true;
               }
            }
            else
            {
               _loc2_ = true;
            }
            return _loc7_ && _loc2_;
         }
         return false;
      }
      
      public static function addOneTime(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:StcXinshouTipsVo = StcMgr.ins.getXinshouTipsVo(int(param1));
         if(_loc3_ && _loc3_.num != 0)
         {
            _loc2_ = getDoneTimes(param1);
            if(history["xinshouTips"][param1])
            {
               var _loc4_:* = history["xinshouTips"];
               var _loc5_:* = param1;
               var _loc6_:* = Number(_loc4_[_loc5_]) + 1;
               _loc4_[_loc5_] = _loc6_;
            }
            else
            {
               history["xinshouTips"][param1] = 1;
            }
            saveHistory();
         }
      }
      
      public static function getDoneTimes(param1:String) : int
      {
         initHisotry();
         var _loc2_:int = history["xinshouTips"][param1];
         return _loc2_;
      }
      
      private static function initHisotry() : void
      {
         var _loc1_:* = null;
         if(history == null)
         {
            _loc1_ = SettingService.ins.getValue(47);
            if(_loc1_)
            {
               try
               {
                  history = JSON.parse(_loc1_);
               }
               catch(err:Error)
               {
               }
            }
            try
            {
               if(history == null)
               {
                  history = {};
                  history["xinshouTips"] = {};
               }
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      private static function saveHistory() : void
      {
         var _loc1_:String = JSON.stringify(history);
         SettingService.ins.save(47,_loc1_);
      }
   }
}
