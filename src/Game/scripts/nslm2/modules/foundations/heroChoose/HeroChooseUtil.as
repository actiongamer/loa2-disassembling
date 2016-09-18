package nslm2.modules.foundations.heroChoose
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   
   public class HeroChooseUtil
   {
       
      
      public function HeroChooseUtil()
      {
         super();
      }
      
      public static function getNpcVoArr(param1:int, param2:Array = null, param3:Array = null) : Array
      {
         var _loc9_:int = 0;
         var _loc8_:Array = StcMgr.ins.getVoArrByMultiColumnValue("static_npc",["group","kind","tupo"],[param1,1,0]);
         var _loc7_:Boolean = param2 && param2.length > 0;
         var _loc4_:Boolean = param3 && param3.length > 0;
         if(_loc7_ == false && _loc4_ == false)
         {
            return _loc8_;
         }
         var _loc6_:Array = [];
         var _loc5_:int = _loc8_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc5_)
         {
            if(!(_loc7_ && param2.indexOf((_loc8_[_loc9_] as StcNpcVo).quality) == -1 || _loc4_ && param3.indexOf((_loc8_[_loc9_] as StcNpcVo).id) != -1))
            {
               _loc6_.push(_loc8_[_loc9_]);
            }
            _loc9_++;
         }
         return _loc6_.sortOn("id");
      }
   }
}
