package nslm2.modules.foundations.activities
{
   import game.ui.activities.render.ActivityCostRenderUI;
   
   public class ActivityCostRender extends ActivityCostRenderUI
   {
       
      
      public function ActivityCostRender()
      {
         super();
         this.txt_discount.font = "Em_YaHeiB";
         this.txt_discount.anchorX = 0.5;
         this.txt_discount.anchorY = 0.5;
         this.txt_discount.rotation = -30;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
      }
   }
}
