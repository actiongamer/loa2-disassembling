package nslm2.common.model
{
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import proto.Item;
   
   public class ChangePlayerData
   {
       
      
      public var wealthArr:Vector.<nslm2.common.model.ChangePlayerWealthVo>;
      
      public var ability:Number = 0;
      
      public var lv:int;
      
      public var totalExp:Number = 0;
      
      public var addItems:Array;
      
      public var reduceItems:Array;
      
      public var addHeroes:Array;
      
      public var reduceHeroes:Array;
      
      public var addBaowu:Array;
      
      public var reduceBaowu:Array;
      
      public function ChangePlayerData()
      {
         super();
      }
      
      public function toAddWealthArr() : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc1_:Array = [];
         if(wealthArr && wealthArr.length > 0)
         {
            _loc5_ = this.wealthArr.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc2_ = this.wealthArr[_loc6_];
               if(_loc2_.count > 0)
               {
                  _loc3_ = WealthUtil.createWealthVo(_loc2_.kind,0,_loc2_.count);
                  _loc1_.push(_loc3_);
               }
               _loc6_++;
            }
         }
         if(this.addItems && this.addItems.length > 0)
         {
            _loc5_ = this.addItems.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = this.addItems[_loc6_];
               _loc3_ = WealthUtil.createItemVo(_loc4_.itemId,_loc4_.count);
               _loc1_.push(_loc3_);
               _loc6_++;
            }
         }
         return _loc1_;
      }
   }
}
