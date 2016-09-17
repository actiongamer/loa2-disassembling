package morn.customs.expands
{
   import morn.core.components.List;
   
   public class ListCellVo
   {
       
      
      public var list:List;
      
      public var listIndex:int;
      
      public var dataIndex:int;
      
      public function ListCellVo(param1:List, param2:int)
      {
         super();
         this.list = param1;
         this.listIndex = param2;
      }
      
      public function get isLastLineInCurPage() : Boolean
      {
         return this.listIndex + 1 == this.list.repeatX * this.list.repeatY;
      }
      
      public function get isLastLine() : Boolean
      {
         return this.dataIndex == this.list.array.length - 1;
      }
   }
}
