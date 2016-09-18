package nslm2.modules.roleInfos.phaseUps.talents
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.roleInfos.phaseUps.RolePhaseUpPanel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroTalentVo;
   
   public class RolePhaseUpPanelTalentMediator implements IDispose
   {
       
      
      public var view:RolePhaseUpPanel;
      
      public function RolePhaseUpPanelTalentMediator(param1:RolePhaseUpPanel)
      {
         super();
         this.view = param1;
      }
      
      public function refresh() : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(FuncOpenAutoCtrl.checkOpen(30113))
         {
            _loc3_ = view.model.heroInfo;
            _loc5_ = StcMgr.ins.getNpcVo(_loc3_.baseInfo.baseId);
            _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_hero_talent",["node"],[_loc5_.node]);
            _loc2_ = [];
            if(_loc4_)
            {
               if(_loc4_.talent_1 > 0 && _loc3_.baseInfo.talent.length >= 1)
               {
                  _loc1_ = PhaseUpTalentVo.initByNode(_loc4_.talent_1,_loc3_.baseInfo.talent[0]);
                  _loc1_.heroId = _loc3_.baseInfo.id;
                  _loc1_.heroPhaseLv = _loc3_.baseInfo.sjLevel;
                  _loc1_.index = 1;
                  _loc2_.push(_loc1_);
               }
               if(_loc4_.talent_2 > 0 && _loc3_.baseInfo.talent.length >= 2)
               {
                  _loc1_ = PhaseUpTalentVo.initByNode(_loc4_.talent_2,_loc3_.baseInfo.talent[1]);
                  _loc1_.heroId = _loc3_.baseInfo.id;
                  _loc1_.heroPhaseLv = _loc3_.baseInfo.sjLevel;
                  _loc1_.index = 2;
                  _loc2_.push(_loc1_);
               }
               if(_loc4_.talent_3 > 0 && _loc3_.baseInfo.talent.length >= 3)
               {
                  _loc1_ = PhaseUpTalentVo.initByNode(_loc4_.talent_3,_loc3_.baseInfo.talent[2]);
                  _loc1_.heroId = _loc3_.baseInfo.id;
                  _loc1_.heroPhaseLv = _loc3_.baseInfo.sjLevel;
                  _loc1_.index = 3;
                  _loc2_.push(_loc1_);
               }
            }
            if(_loc2_.length == 0)
            {
               view.box_talent.visible = false;
            }
            else
            {
               view.box_talent.visible = true;
               view.list_talent.dataSource = _loc2_;
            }
         }
         else
         {
            view.box_talent.visible = false;
         }
      }
      
      public function dispose() : void
      {
         this.view = null;
      }
   }
}
