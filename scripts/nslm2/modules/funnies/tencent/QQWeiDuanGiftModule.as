package nslm2.modules.funnies.tencent
{
   import game.ui.TencentModule.QQWeiDuanGiftModuleUI;
   
   public class QQWeiDuanGiftModule extends QQWeiDuanGiftModuleUI
   {
       
      
      public function QQWeiDuanGiftModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.panelBg.titleImgId = this.moduleId;
         this.list.dataSource = [1,2,3];
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
      
      override public function dispose() : void
      {
      }
   }
}
