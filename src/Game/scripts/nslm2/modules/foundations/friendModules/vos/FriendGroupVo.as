package nslm2.modules.foundations.friendModules.vos
{
   public class FriendGroupVo
   {
      
      public static const ID:String = "id";
      
      public static const NAME:String = "name";
      
      public static const COUNT:String = "count";
      
      public static const MAX:String = "max";
       
      
      public var id:int;
      
      public var name:String;
      
      public var max:int;
      
      public function FriendGroupVo(param1:int, param2:String, param3:int)
      {
         super();
         this.id = param1;
         this.name = param2;
         this.max = param3;
      }
   }
}
