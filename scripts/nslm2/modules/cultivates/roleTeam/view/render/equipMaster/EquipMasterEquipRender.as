package nslm2.modules.cultivates.roleTeam.view.render.equipMaster
{
   import game.ui.roleTeam.render.EquipMasterEquipRenderUI;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcEquipStrengthVo;
   import nslm2.mgrs.stcMgrs.vos.StcEquipJinglianVo;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   
   public class EquipMasterEquipRender extends EquipMasterEquipRenderUI
   {
       
      
      private var data:HeroEquipVo;
      
      public function EquipMasterEquipRender()
      {
         super();
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(data)
         {
            return data.wealthVo;
         }
         return null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         data = param1 as HeroEquipVo;
         if(data)
         {
            switch(int(RoleTeamModel.ins.equipMasterIndex))
            {
               case 0:
                  _loc2_ = data.wealthVo.item.strengthId;
                  _loc5_ = StcMgr.ins.getEquipStrengthVo(_loc2_);
                  if(_loc5_)
                  {
                     _loc3_ = _loc5_.level;
                  }
                  break;
               case 1:
                  _loc2_ = data.wealthVo.item.jinglianId;
                  _loc4_ = StcMgr.ins.getEquipJinglianVo(_loc2_);
                  if(_loc4_)
                  {
                     _loc3_ = _loc4_.level;
                  }
                  break;
               case 2:
                  _loc3_ = data.wealthVo.treasure.level;
                  break;
               case 3:
                  _loc3_ = TreasureUtil.getMaxRuneLevel(data.wealthVo.treasure.fumo);
            }
            progressBar.value = _loc3_ / data.targetLvl;
            txt_progress.text = _loc3_ + "/" + data.targetLvl;
         }
         .super.dataSource = param1;
      }
   }
}
