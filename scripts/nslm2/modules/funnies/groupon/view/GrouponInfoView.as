package nslm2.modules.funnies.groupon.view
{
   import game.ui.groupon.GrouponViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.modules.funnies.groupon.service.GrouponService;
   import nslm2.modules.funnies.groupon.vo.GrouponVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class GrouponInfoView extends GrouponViewUI implements IViewStackPage
   {
       
      
      private var model:GrouponModel;
      
      private var gServeice:GrouponService;
      
      public function GrouponInfoView()
      {
         model = GrouponModel.ins;
         gServeice = GrouponService.ins;
         super();
         list_activity.selectHandler = listSelectChangeHandler;
         (pageBarUI as IPageBar).bindList(list_activity);
      }
      
      private function listSelectChangeHandler() : void
      {
         model.crtGrouponId = (list_activity.selectedItem as GrouponVo).id;
         ObserverMgr.ins.sendNotice("groupon_notice_update_detail");
         gServeice.getGrouponInfo(model.crtGrouponId);
      }
      
      public function viewStackIn() : void
      {
         list_activity.dataSource = model.grouponDataList;
         if(list_activity.selectedIndex != -1)
         {
            this.fadeIn();
         }
         if(list_activity.selectedIndex == -1)
         {
            list_activity.selectedIndex = 0;
         }
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
   }
}
