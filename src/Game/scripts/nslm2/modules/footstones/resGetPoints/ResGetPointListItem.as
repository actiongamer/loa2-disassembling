package nslm2.modules.footstones.resGetPoints
{
   public class ResGetPointListItem
   {
       
      
      public var funcId:int;
      
      public var star:int;
      
      public var paraId:String;
      
      public var name:String;
      
      public var desc:String;
      
      public function ResGetPointListItem(param1:int, param2:int, param3:String, param4:String, param5:String)
      {
         super();
         this.funcId = param1;
         this.star = param2;
         this.paraId = param3;
         this.name = param4;
         this.desc = param5;
      }
   }
}
