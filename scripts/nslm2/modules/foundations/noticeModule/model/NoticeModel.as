package nslm2.modules.foundations.noticeModule.model
{
   import nslm2.modules.foundations.noticeModule.vo.NoticeVo;
   import nslm2.utils.ServerTimer;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.noticeModule.vo.NoticeGroupVo;
   
   public class NoticeModel
   {
      
      private static var _ins:nslm2.modules.foundations.noticeModule.model.NoticeModel;
      
      public static const MAX_NOTICE_CNT:int = 20;
       
      
      public var noticeArr:Array;
      
      public var notifyArr:Array;
      
      public function NoticeModel()
      {
         noticeArr = [];
         notifyArr = [];
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.noticeModule.model.NoticeModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.noticeModule.model.NoticeModel();
         }
         return _ins;
      }
      
      public function pushNotice(param1:NoticeVo) : void
      {
         param1.timeStamp = ServerTimer.ins.second;
         this.noticeArr.unshift(param1);
         noticeArr.length = noticeArr.length > 20?20:noticeArr.length;
         ObserverMgr.ins.sendNotice("notice_show_new_notice");
      }
      
      public function getLastNotice() : NoticeVo
      {
         return noticeArr[0];
      }
      
      public function getLastNotify() : NoticeVo
      {
         return notifyArr[0];
      }
      
      public function pushNotify(param1:NoticeVo) : void
      {
         this.notifyArr.unshift(param1);
         notifyArr.length = notifyArr.length > 20?20:notifyArr.length;
         ObserverMgr.ins.sendNotice("notice_show_new_notify");
      }
      
      public function getNoticeGroupArr() : Array
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc1_:Array = [];
         var _loc4_:int = noticeArr.length;
         var _loc6_:int = -1;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = noticeArr[_loc5_];
            if(_loc6_ != _loc2_.type)
            {
               _loc6_ = _loc2_.type;
               _loc3_ = new NoticeGroupVo();
               _loc3_.type = _loc6_;
               _loc1_.push(_loc3_);
            }
            if(!_loc3_.contentArr)
            {
               _loc3_.contentArr = [];
            }
            _loc3_.contentArr.push(_loc2_);
            _loc5_++;
         }
         return _loc1_;
      }
   }
}
