package nslm2.modules.cultivates.pet.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import proto.PetInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   
   public class PetInfoVo
   {
      
      public static const ID:String = "id";
      
      public static const POS_MAX:int = 6;
       
      
      public var id:int;
      
      public var basePropArr:Array;
      
      public var petSkinPropArr:Array;
      
      public var petPropectProp:Array;
      
      public var posBuffArr:Array;
      
      public var stcVo:StcNpcVo;
      
      private var _petInfo:PetInfo;
      
      public function PetInfoVo(param1:int)
      {
         basePropArr = [];
         petSkinPropArr = [];
         petPropectProp = [];
         posBuffArr = [];
         super();
         id = param1;
         initPorpArr();
         initPosBuff();
      }
      
      public function get petInfo() : PetInfo
      {
         return _petInfo;
      }
      
      public function set petInfo(param1:PetInfo) : void
      {
         _petInfo = param1;
         initPetSkinPorpArr();
      }
      
      private function initPorpArr() : void
      {
         stcVo = StcMgr.ins.getNpcVo(id);
         if(stcVo)
         {
            basePropArr = PetUtil.initBasePropList(stcVo);
         }
      }
      
      public function initPetSkinPorpArr() : void
      {
         stcVo = StcMgr.ins.getNpcVo(id);
         if(stcVo)
         {
            petSkinPropArr = PetUtil.initSkinPropList(stcVo,petInfo);
         }
      }
      
      private function initPosBuff() : void
      {
         posBuffArr = PetUtil.getPosBuffArr(id,0);
      }
   }
}
