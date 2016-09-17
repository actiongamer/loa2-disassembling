package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import com.mz.core.interFace.IDispose;
   import proto.HeroInfo;
   import com.mz.core.utils.DictHash;
   
   public class HCModel implements IDispose
   {
      
      private static var _ins:nslm2.modules.cultivates.otherRoleInfos.heroCompare.HCModel;
       
      
      private var _heros:Array;
      
      public function HCModel()
      {
         super();
         _heros = [null,null,null,null];
      }
      
      public static function get ins() : nslm2.modules.cultivates.otherRoleInfos.heroCompare.HCModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.otherRoleInfos.heroCompare.HCModel();
         }
         return _ins;
      }
      
      public function SetHero(param1:int, param2:HeroInfo) : void
      {
         if(param1 > 3 || param1 < 0)
         {
            return;
         }
         _heros[param1] = param2;
      }
      
      public function GetHero(param1:int) : HeroInfo
      {
         if(param1 > 3 || param1 < 0)
         {
            return null;
         }
         return _heros[param1];
      }
      
      public function GetUsedSelfHero() : DictHash
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:DictHash = new DictHash();
         if(_heros[0] != null)
         {
            _loc2_ = _heros[0] as HeroInfo;
            _loc1_.put(_loc2_.baseInfo.id,_loc2_);
         }
         if(_heros[2] != null)
         {
            _loc3_ = _heros[2] as HeroInfo;
            _loc1_.put(_loc3_.baseInfo.id,_loc3_);
         }
         return _loc1_;
      }
      
      public function GetUsedTargetHero() : DictHash
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:DictHash = new DictHash();
         if(_heros[1] != null)
         {
            _loc2_ = _heros[1] as HeroInfo;
            _loc1_.put(_loc2_.baseInfo.id,_loc2_);
         }
         if(_heros[3] != null)
         {
            _loc3_ = _heros[3] as HeroInfo;
            _loc1_.put(_loc3_.baseInfo.id,_loc3_);
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}
