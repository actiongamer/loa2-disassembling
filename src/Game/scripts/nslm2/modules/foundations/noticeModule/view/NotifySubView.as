package nslm2.modules.foundations.noticeModule.view
{
   import game.ui.noticeModules.NotifySubViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.noticeModule.model.NoticeModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class NotifySubView extends NotifySubViewUI implements IViewStackPage, IObserver
   {
       
      
      private var model:NoticeModel;
      
      public function NotifySubView()
      {
         model = NoticeModel.ins;
         super();
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         this.list_content.dataSource = model.notifyArr;
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
         return ["notice_show_new_notify"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param1 == "notice_show_new_notify")
         {
            this.list_content.dataSource = model.notifyArr;
         }
      }
   }
}
