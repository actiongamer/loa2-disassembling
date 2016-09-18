package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.PropRenderUI;
   
   public class PropRender extends PropRenderUI
   {
       
      
      public function PropRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         txt_value.text = param1 + "";
      }
   }
}
