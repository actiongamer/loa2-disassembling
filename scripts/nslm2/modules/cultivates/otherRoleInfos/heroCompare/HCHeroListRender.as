package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCHeroListRenderUI;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class HCHeroListRender extends HCHeroListRenderUI
   {
       
      
      public var idx:int;
      
      private var heroId:UInt64;
      
      private var _data:RoleTeamVo;
      
      public function HCHeroListRender()
      {
         super();
         this.addEventListener("click",this.selectHeroHandler);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1 == null)
         {
            heroId = null;
            .super.dataSource = null;
            return;
         }
         var _loc2_:RoleTeamVo = param1 as RoleTeamVo;
         _data = _loc2_;
         .super.dataSource = WealthUtil.createNpcVo(_loc2_.heroData.baseId);
         heroId = _loc2_.heroData.id;
      }
      
      override protected function validateTxtName() : void
      {
         var _loc1_:* = null;
         super.validateTxtName();
         if(!_data)
         {
            return;
         }
         if(PlayerModel.ins.isCurPlayer(_data.heroData.id))
         {
            txt_name.color = ColorLib.getMilitaryColor(PlayerModel.ins.playerInfo.militaryrank);
            _loc1_ = PlayerModel.ins.playerInfo.name;
            txt_name.text = _loc1_;
         }
         if(Uint64Util.equal(OtherRoleInfoModel.ins.playerHero.baseInfo.id,_data.heroData.id))
         {
            txt_name.color = ColorLib.getMilitaryColor(OtherRoleInfoModel.ins.military);
            _loc1_ = OtherRoleInfoModel.ins.name;
            txt_name.text = _loc1_;
         }
      }
      
      override protected function validateTooltip() : void
      {
         this.toolTip = null;
      }
      
      private function selectHeroHandler(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("hc_select_hero",[heroId,idx]);
         ModuleMgr.ins.closeModule(11701);
      }
   }
}
