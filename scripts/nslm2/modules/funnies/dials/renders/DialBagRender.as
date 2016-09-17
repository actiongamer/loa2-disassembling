package nslm2.modules.funnies.dials.renders
{
   import game.ui.dialModule.renders.DialBagRenderUI;
   
   public class DialBagRender extends DialBagRenderUI
   {
       
      
      public function DialBagRender()
      {
         super();
         this.needShowValidBg = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         this.visible = true;
      }
   }
}
