package nslm2.modules.cultivates.treasure.vo
{
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   
   public class RuneCategoryVo
   {
       
      
      public var type:int;
      
      private var _runeArr:Array;
      
      private var _count:int;
      
      public function RuneCategoryVo()
      {
         super();
      }
      
      public function get count() : int
      {
         return _count;
      }
      
      public function get runeArr() : Array
      {
         return _runeArr;
      }
      
      public function set runeArr(param1:Array) : void
      {
         _runeArr = param1;
         _count = 0;
         _runeArr.sort(TreasureUtil.sortRune);
         var _loc4_:int = 0;
         var _loc3_:* = _runeArr;
         for each(var _loc2_ in _runeArr)
         {
            _count = _count + PlayerModel.ins.getCountByWealthVo(_loc2_);
         }
      }
   }
}
