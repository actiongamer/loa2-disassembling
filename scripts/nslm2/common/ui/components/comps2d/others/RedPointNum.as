package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class RedPointNum extends RedPointNumUI
   {
       
      
      public var autoHide:Boolean = true;
      
      public function RedPointNum(param1:int = 0)
      {
         super();
         this.count = param1;
         this.mouseEvent = false;
      }
      
      public function get count() : int
      {
         return int(this.txt_count.text);
      }
      
      public function set count(param1:int) : void
      {
         this.txt_count.text = String(param1);
         if(autoHide)
         {
            this.visible = param1 > 0;
         }
      }
   }
}
