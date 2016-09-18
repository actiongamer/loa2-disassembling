package nslm2.modules.cultivates.skillChangePanels
{
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.cultivates.horse.HorseService;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   
   public class SkillChangeModel
   {
      
      private static var _ins:nslm2.modules.cultivates.skillChangePanels.SkillChangeModel;
       
      
      public var newNorSkillVec:Vector.<uint>;
      
      public var newSpeSkillVec:Vector.<uint>;
      
      public var newAuraVec:Vector.<uint>;
      
      public function SkillChangeModel()
      {
         newNorSkillVec = new Vector.<uint>();
         newSpeSkillVec = new Vector.<uint>();
         newAuraVec = new Vector.<uint>();
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.skillChangePanels.SkillChangeModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.skillChangePanels.SkillChangeModel();
         }
         return _ins;
      }
      
      public function isNewNorSkill(param1:uint) : Boolean
      {
         return newNorSkillVec.indexOf(param1) != -1;
      }
      
      public function isNewSpeSkill(param1:uint) : Boolean
      {
         return newSpeSkillVec.indexOf(param1) != -1;
      }
      
      public function isNewAura(param1:uint) : Boolean
      {
         return newAuraVec.indexOf(param1) != -1;
      }
      
      public function getUsingNorSkillId() : uint
      {
         var _loc1_:uint = FashionModel.ins.usingNormalSkillId;
         return _loc1_ != 0?_loc1_:uint(getPlayerInitNorSkill());
      }
      
      public function getUsingSpeSkillId() : uint
      {
         var _loc1_:uint = FashionModel.ins.usingSpecialSkillId;
         return _loc1_ != 0?_loc1_:uint(getPlayerInitSpeSkill());
      }
      
      public function getUsingAuraId() : uint
      {
         return HorseService.ins.curAuraId;
      }
      
      public function getSpeSkillList() : Array
      {
         var _loc1_:* = null;
         if(getPlayerInitSpeSkill())
         {
            _loc1_ = ArrayUtil.concat([getUsingSpeSkillId(),getPlayerInitSpeSkill()],FashionModel.ins.activatedSpeSkillArr);
         }
         else
         {
            _loc1_ = ArrayUtil.concat([getUsingSpeSkillId()],FashionModel.ins.activatedSpeSkillArr);
         }
         return ArrayUtil.removeRepeat(_loc1_).sort(sortFun);
      }
      
      public function getNorSkillList() : Array
      {
         var _loc1_:* = null;
         if(getPlayerInitNorSkill())
         {
            _loc1_ = ArrayUtil.concat([getUsingNorSkillId(),getPlayerInitNorSkill()],FashionModel.ins.activatedNorSkillArr);
         }
         else
         {
            _loc1_ = ArrayUtil.concat([getUsingNorSkillId()],FashionModel.ins.activatedNorSkillArr);
         }
         return ArrayUtil.removeRepeat(_loc1_).sort(sortFun);
      }
      
      public function getAuraList() : Array
      {
         var _loc1_:Array = ArrayUtil.copy(HorseService.ins.activatedAuraList);
         return _loc1_.sort(sortFun);
      }
      
      public function getPlayerInitNorSkill() : uint
      {
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId);
         var _loc1_:uint = _loc3_.skill_id2;
         var _loc2_:StcSkillVo = StcMgr.ins.getSkillVo(_loc1_);
         if(_loc2_)
         {
            return _loc1_;
         }
         return null;
      }
      
      public function getPlayerInitSpeSkill() : uint
      {
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(PlayerModel.ins.playerInfo.playerHero.baseInfo.baseId);
         var _loc1_:uint = _loc3_.skill_id1;
         var _loc2_:StcSkillVo = StcMgr.ins.getSkillVo(_loc1_);
         if(_loc2_)
         {
            return _loc1_;
         }
         return null;
      }
      
      public function isNew(param1:uint) : Boolean
      {
         return this.newNorSkillVec.indexOf(param1) != -1 || this.newSpeSkillVec.indexOf(param1) != -1 || this.newAuraVec.indexOf(param1) != -1;
      }
      
      public function isUsing(param1:uint) : Boolean
      {
         return param1 != 0 && (this.getUsingAuraId() == param1 || this.getUsingNorSkillId() == param1 || this.getUsingSpeSkillId() == param1);
      }
      
      public function hasNewSkill() : Boolean
      {
         return this.newAuraVec.length > 0 || this.newNorSkillVec.length > 0 || this.newSpeSkillVec.length > 0;
      }
      
      private function sortFun(param1:uint, param2:uint) : int
      {
         if(isUsing(param1))
         {
            return -1;
         }
         if(isUsing(param2))
         {
            return 1;
         }
         if(isNew(param1))
         {
            return -1;
         }
         if(isNew(param2))
         {
            return 1;
         }
         return 0;
      }
   }
}
