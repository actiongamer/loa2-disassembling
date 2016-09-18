package morn.customs.components
{
   import morn.core.components.List;
   import morn.core.components.Box;
   
   public class WealthList extends List
   {
       
      
      private var _showMultipleSign:Boolean = false;
      
      public function WealthList()
      {
         super();
         if(this.itemRender == null)
         {
         }
      }
      
      public function get showMultipleSign() : Boolean
      {
         return _showMultipleSign;
      }
      
      public function set showMultipleSign(param1:Boolean) : void
      {
         _showMultipleSign = param1;
         this.callLater(this.changeCells);
      }
      
      override protected function createCell() : Box
      {
         var _loc1_:Box = super.createCell();
         (_loc1_ as WealthRender).showMultipleSign = this.showMultipleSign;
         return _loc1_;
      }
   }
}
