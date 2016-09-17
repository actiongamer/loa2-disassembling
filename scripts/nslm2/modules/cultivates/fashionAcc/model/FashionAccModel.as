package nslm2.modules.cultivates.fashionAcc.model
{
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   
   public class FashionAccModel
   {
      
      public static const REFRESH_ACC:String = "refresh_acc";
      
      public static const FASHION_ACC_OPENED:String = "fashion_acc";
      
      public static const FASHION_ACC_KIND:int = 1;
      
      public static const SELECT_SKILL_KIND_LEFT:String = "select_skill_kind_right";
      
      public static const SELECT_SKILL_KIND_RIGHT:String = "select_skill_kind_right";
      
      public static const EVT_ACC_SKILL_USING_CHANGE:String = "evt_acc_skill_using_change";
      
      public static const ACC_MAKE_CPL:String = "acc_make_cpl";
      
      private static var _ins:nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
       
      
      public var curFashionAccId:int = 0;
      
      public const SELECT:int = 1;
      
      public const EXTRA_SKILL_KIND_LEFT:int = 1;
      
      public const EXTRA_SKILL_KIND_RIGHT:int = 2;
      
      private var voDict:DictHash;
      
      public function FashionAccModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.fashionAcc.model.FashionAccModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.fashionAcc.model.FashionAccModel();
         }
         return _ins;
      }
      
      public function getVoDict() : DictHash
      {
         if(voDict == null)
         {
            voDict = new DictHash();
            var _loc3_:int = 0;
            var _loc2_:* = StcMgr.ins.getFashionSynTable().array;
            for each(var _loc1_ in StcMgr.ins.getFashionSynTable().array)
            {
               if(_loc1_.itemType && voDict.containsKey(_loc1_.itemType))
               {
                  if(_loc1_.kind == 1)
                  {
                     voDict.getValue(_loc1_.itemType).push(_loc1_);
                  }
               }
               else if(_loc1_.kind == 1)
               {
                  voDict.put(_loc1_.itemType,[_loc1_]);
               }
            }
         }
         return voDict;
      }
   }
}
