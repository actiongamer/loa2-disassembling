package nslm2.modules.funnies.secretExplore
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.funnies.arenas.scores.ArenaScoreVo;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.MjtxInfoRes;
   
   public class SEModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.funnies.secretExplore.SEModel;
       
      
      public var swapActionInfos:DictHash;
      
      public var canGetScoreReward:Boolean;
      
      public var info:MjtxInfoRes;
      
      public function SEModel()
      {
         swapActionInfos = new DictHash();
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.secretExplore.SEModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.secretExplore.SEModel();
         }
         return _ins;
      }
      
      public function checkScoreCanGet() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         canGetScoreReward = false;
         var _loc2_:int = this.swapActionInfos.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.swapActionInfos.array[_loc3_];
            if(_loc1_.canGetReward)
            {
               canGetScoreReward = true;
            }
            _loc3_++;
         }
         ObserverMgr.ins.sendNotice("OPT_SECRET_EXPLORE_RED_POINT_CHECK");
      }
   }
}
