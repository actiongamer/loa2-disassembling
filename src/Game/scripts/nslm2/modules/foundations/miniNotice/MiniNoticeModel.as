package nslm2.modules.foundations.miniNotice
{
   import com.mz.core.utils.DictHash;
   import proto.FunctionActionNotify;
   import proto.FunctionActionInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.utils.RTools;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   
   public class MiniNoticeModel
   {
      
      private static var _ins:nslm2.modules.foundations.miniNotice.MiniNoticeModel;
       
      
      public var eventDict:DictHash;
      
      public function MiniNoticeModel()
      {
         eventDict = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.miniNotice.MiniNoticeModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.miniNotice.MiniNoticeModel();
         }
         return _ins;
      }
      
      public function parseNotify(param1:FunctionActionNotify) : void
      {
         if(param1)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.actionInfos;
            for each(var _loc2_ in param1.actionInfos)
            {
               if(_loc2_.status == 0 && _loc2_.starttime == 0)
               {
                  eventDict.remove(_loc2_.funcid);
               }
               else
               {
                  eventDict.put(_loc2_.funcid,_loc2_);
               }
            }
         }
         ObserverMgr.ins.sendNotice("MSG_FUNCTION_ACTION_CHANGED",param1.actionInfos);
      }
      
      public function getFirstNeedShowArr() : Array
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc4_:Array = eventDict.array;
         var _loc2_:int = _loc4_.length;
         var _loc3_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc1_ = _loc4_[_loc5_];
            if(_loc1_.status == 1 || ServerTimer.ins.second > _loc1_.starttime - 3600)
            {
               _loc3_.push(_loc1_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function getTodayEventArr() : Array
      {
         var _loc7_:int = 0;
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc5_:Array = eventDict.array;
         var _loc3_:int = _loc5_.length;
         var _loc4_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc1_ = _loc5_[_loc7_];
            _loc6_ = ServerTimer.ins.date;
            _loc2_ = new DateUtils();
            _loc2_.time = _loc1_.starttime * 1000;
            if(_loc6_.date == _loc2_.date || _loc1_.status == 1)
            {
               _loc4_.push(_loc1_);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function changeStatus(param1:int, param2:int) : void
      {
         var _loc3_:FunctionActionInfo = eventDict.getValue(param1);
         if(_loc3_)
         {
            _loc3_.status = param2;
            eventDict.put(param1,_loc3_);
         }
      }
      
      public function addSelfActionInfos() : void
      {
         addGuildCrossActionInfos();
         addTPKCActionInfos();
      }
      
      public function addGuildCrossActionInfos() : void
      {
         var _loc11_:int = 0;
         var _loc1_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc4_:Array = GPKCModel.ins.openAry();
         var _loc2_:int = _loc4_[1];
         var _loc10_:int = _loc4_[2];
         var _loc7_:int = _loc4_[3];
         var _loc5_:Array = String(DefindConsts.FAMILY_EXPE_TIME_INTVL).split("|");
         var _loc6_:int = _loc5_[0];
         var _loc9_:int = _loc5_[1];
         var _loc3_:Array = [];
         _loc11_ = 0;
         while(_loc11_ < _loc4_[4])
         {
            _loc1_ = RTools.getTimestamp(_loc2_,_loc10_,_loc7_,_loc6_,0,0);
            _loc1_ = _loc1_ + _loc11_ * 60 * 60 * 24 * 1000;
            _loc8_ = RTools.getTimestamp(_loc2_,_loc10_,_loc7_,_loc9_,0,0);
            _loc8_ = _loc8_ + _loc11_ * 60 * 60 * 24 * 1000;
            _loc3_.push(new MiniNoticeOpenTimeVo(40760,_loc1_ / 1000,_loc8_ / 1000));
            _loc11_++;
         }
         _loc3_.sortOn("startTime",16);
         MiniNoticeFakeNotifyTimer.parseArrToFakeNotify(_loc3_);
      }
      
      public function addTPKCActionInfos() : void
      {
         var _loc8_:Array = TPKCModel.ins.openAry();
         var _loc7_:Array = String(DefindConsts.CROSS_GROUP_FIRST_STAGE).split("|");
         var _loc9_:Array = String(DefindConsts.CROSS_GROUP_SECOND_STAGE).split("|");
         var _loc5_:Number = RTools.getTimestamp(_loc8_[1],_loc8_[2],_loc8_[3],0,0,0,0);
         var _loc4_:DateUtils = new DateUtils(RTools.getTimestamp(_loc8_[1],_loc8_[2],_loc8_[3],0,0,0,0));
         var _loc3_:uint = _loc5_ / 1000;
         var _loc2_:uint = _loc5_ / 1000 + (int(_loc7_[0]) + int(_loc9_[0]) + 2) * 3600 * 24 - 60;
         var _loc1_:* = _loc2_;
         var _loc6_:Array = [];
         _loc6_.push(new MiniNoticeOpenTimeVo(42000,_loc3_,_loc1_));
         MiniNoticeFakeNotifyTimer.parseArrToFakeNotify(_loc6_);
      }
   }
}
