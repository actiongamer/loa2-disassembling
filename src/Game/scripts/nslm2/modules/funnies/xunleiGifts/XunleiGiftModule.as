package nslm2.modules.funnies.xunleiGifts
{
   import game.ui.xunleiGiftModule.XunleiGiftModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.funnies.xunleiGifts.view.XunLeiVipLvView;
   import nslm2.modules.funnies.xunleiGifts.render.XunLeiLeftTabRender;
   
   public class XunleiGiftModule extends XunleiGiftModuleUI
   {
       
      
      private var vs:ViewStack;
      
      public function XunleiGiftModule()
      {
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         vs = new ViewStack();
         vs.x = 188;
         vs.y = 148;
         vs.subViewClasses = [XunLeiVipLvView];
         addChild(vs);
         this.list_title.changeHandler = listClickHandler;
         this.panelBg.titleImgId = this.moduleId;
         this.list_title.dataSource = [60767];
         this.list_title.selectedIndex = 0;
         this.vs.selectedIndex = this.list_title.selectedIndex;
         reCountRedPoi();
         super.preShow(param1);
      }
      
      private function listClickHandler() : void
      {
         this.vs.selectedIndex = list_title.selectedIndex;
      }
      
      private function reCountRedPoi() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         this.list_title.commitMeasure();
         var _loc2_:int = this.list_title.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list_title.cells[_loc3_] as XunLeiLeftTabRender;
            _loc1_.reCountRedPoi();
            _loc3_++;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_NPC_FUNC_VO_CHANGE"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
         {
            if(param2 == 60767)
            {
               this.reCountRedPoi();
            }
         }
      }
   }
}
