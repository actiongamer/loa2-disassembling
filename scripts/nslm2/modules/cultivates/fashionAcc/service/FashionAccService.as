package nslm2.modules.cultivates.fashionAcc.service
{
   import flash.events.EventDispatcher;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import proto.FashionSkillReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   
   public class FashionAccService extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.fashionAcc.service.FashionAccService;
       
      
      private var _skillId:int;
      
      private var _skillId2:int;
      
      public function FashionAccService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.fashionAcc.service.FashionAccService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.fashionAcc.service.FashionAccService();
         }
         return _ins;
      }
      
      public function changeSkill(param1:int) : void
      {
         _skillId2 = param1;
         var _loc4_:StcFashionExtraSkillVo = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",param1);
         var _loc2_:StcFashionSynVo = StcMgr.ins.getVoByColumnValue("static_fashion_syn","skill",_loc4_.id);
         var _loc3_:FashionSkillReq = new FashionSkillReq();
         _skillId = _loc2_.id;
         _loc3_.id = _loc2_.id;
         ServerEngine.ins.send(6286,_loc3_,skillCpl);
      }
      
      private function skillCpl() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = StcMgr.ins.getFashionExtraSkillVo(StcMgr.ins.getFashionSynVo(_skillId).skill).skillId;
         var _loc5_:int = 0;
         var _loc4_:* = PlayerModel.ins.playerInfo.playerHero.baseInfo.skill;
         for each(var _loc2_ in PlayerModel.ins.playerInfo.playerHero.baseInfo.skill)
         {
            _loc3_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",_loc2_);
            if(_loc3_)
            {
               if(StcMgr.ins.getFashionSynVo(_skillId).kind == _loc3_.kind)
               {
                  ArrayUtil.replaceItem(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill,_loc2_,_loc1_);
               }
            }
         }
         this.dispatchEvent(new MzEvent("evt_acc_skill_using_change",_loc1_));
      }
   }
}
