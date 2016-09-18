package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendSubListUI;
   
   public class FriendSubList extends FriendSubListUI
   {
       
      
      public function FriendSubList()
      {
         super();
         this.list_firend.selectEnable = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:Array = param1 as Array;
         if(_loc2_)
         {
            this.list_firend.repeatY = _loc2_.length;
            this.list_firend.array = _loc2_;
            this.list_firend.commitMeasure();
            if(_loc2_.length > 0)
            {
               this.height = this.list_firend.height;
            }
            else
            {
               this.height = 0;
            }
         }
         else
         {
            this.height = 0;
         }
      }
   }
}
