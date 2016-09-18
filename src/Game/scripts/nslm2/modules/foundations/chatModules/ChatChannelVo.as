package nslm2.modules.foundations.chatModules
{
   public class ChatChannelVo
   {
      
      public static const ID:String = "id";
      
      public static const NAME:String = "name";
      
      public static const COLOR:String = "color";
       
      
      public var id:int;
      
      public var name:String;
      
      public var color:uint;
      
      public var showSimple:Boolean;
      
      public function ChatChannelVo(param1:int, param2:String, param3:uint, param4:Boolean)
      {
         super();
         this.id = param1;
         this.name = param2;
         this.color = param3;
         this.showSimple = param4;
      }
      
      public function get needCheckFilter() : Boolean
      {
         var _loc1_:* = id;
         if(2 !== _loc1_)
         {
            if(1 !== _loc1_)
            {
               if(11 !== _loc1_)
               {
                  if(44 !== _loc1_)
                  {
                     return true;
                  }
               }
               addr8:
               return false;
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
   }
}
