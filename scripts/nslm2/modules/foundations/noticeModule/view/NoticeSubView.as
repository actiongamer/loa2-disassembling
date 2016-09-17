package nslm2.modules.foundations.noticeModule.view
{
   import game.ui.noticeModules.NoticeSubViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.noticeModule.model.NoticeModel;
   import nslm2.modules.foundations.noticeModule.vo.NoticeGroupVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class NoticeSubView extends NoticeSubViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:NoticeModel;
      
      private var noticeGroupViews:Array;
      
      public function NoticeSubView()
      {
         model = NoticeModel.ins;
         noticeGroupViews = [];
         super();
      }
      
      private function updateContent() : void
      {
         var _loc1_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = model.getNoticeGroupArr();
         var _loc5_:int = _loc3_.length;
         var _loc2_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = _loc3_[_loc6_];
            _loc1_ = noticeGroupViews[_loc6_];
            if(!_loc1_)
            {
               _loc1_ = new NoticeGroupView();
               panel_content.addChild(_loc1_);
               noticeGroupViews[_loc6_] = _loc1_;
            }
            _loc1_.dataSource = _loc4_;
            _loc1_.y = _loc2_;
            _loc2_ = _loc2_ + _loc1_.height;
            _loc6_++;
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         updateContent();
         this.fadeIn();
         ObserverMgr.ins.regObserver(this);
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_show_new_notice"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "notice_show_new_notice")
         {
            updateContent();
         }
      }
   }
}
