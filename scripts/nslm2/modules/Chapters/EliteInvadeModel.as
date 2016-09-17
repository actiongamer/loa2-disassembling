package nslm2.modules.Chapters
{
   import com.mz.core.utils.DictHash;
   import proto.EliteInvade;
   import org.manager.DateUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class EliteInvadeModel
   {
      
      private static var _ins:nslm2.modules.Chapters.EliteInvadeModel;
       
      
      public var eliteStageDic:DictHash;
      
      public function EliteInvadeModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.Chapters.EliteInvadeModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.Chapters.EliteInvadeModel();
         }
         return _ins;
      }
      
      public function parseElite(param1:Array) : void
      {
         eliteStageDic = new DictHash();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            eliteStageDic.put(_loc2_.id,_loc2_);
         }
      }
      
      public function getEliteStageArrByTime(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = eliteStageDic.array;
         for each(var _loc2_ in eliteStageDic.array)
         {
            _loc3_ = new DateUtils();
            _loc3_.time = _loc2_.stamp * 1000;
            if(_loc3_.getHours() == param1)
            {
               _loc4_.push(_loc2_);
            }
         }
         while(_loc4_.length < 2)
         {
            _loc4_.push(null);
         }
         return _loc4_;
      }
      
      public function getEliteStageArr() : Array
      {
         return eliteStageDic.array;
      }
      
      public function onAddNew(param1:Array) : void
      {
         if(eliteStageDic == null)
         {
            eliteStageDic = new DictHash();
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            eliteStageDic.put(_loc2_.id,_loc2_);
         }
         ObserverMgr.ins.sendNotice("evtEliteInfoRefreshed");
      }
      
      public function isFinished(param1:int) : Boolean
      {
         var _loc2_:EliteInvade = eliteStageDic.getValue(param1);
         return _loc2_ && _loc2_.hp <= 0 && _loc2_.maxhp != 0;
      }
      
      public function getLeftHpPercent(param1:int) : Number
      {
         var _loc2_:EliteInvade = eliteStageDic.getValue(param1);
         if(_loc2_.maxhp == 0)
         {
            return 1;
         }
         return _loc2_.hp / _loc2_.maxhp;
      }
      
      public function getEliteStageInfo(param1:int) : EliteInvade
      {
         return eliteStageDic.getValue(param1);
      }
      
      public function getResetTimeArr() : Array
      {
         var _loc4_:* = null;
         var _loc3_:Array = (DefindConsts.HEROSTAGE_ELITE_RESET_TIME as String).split("|");
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc1_ in _loc3_)
         {
            _loc4_ = _loc1_.split(":")[0];
            if(_loc4_.indexOf("0") == 0)
            {
               _loc2_.push((_loc4_ as String).charAt(1));
            }
            else
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
   }
}
