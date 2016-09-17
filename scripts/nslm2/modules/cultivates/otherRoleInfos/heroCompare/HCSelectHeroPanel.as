package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.panel.HCSelectHeroPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
   
   public class HCSelectHeroPanel extends HCSelectHeroPanelUI
   {
       
      
      public var idx:int;
      
      public function HCSelectHeroPanel()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000076);
         this.dataSource = param1;
         super.preShow(param1);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc5_:* = null;
         this.idx = param1 as int;
         var _loc2_:Array = [];
         if(idx % 2 == 0)
         {
            _loc5_ = HCModel.ins.GetUsedSelfHero();
            var _loc8_:int = 0;
            var _loc7_:* = HeroModel.ins.teamHeroArr;
            for each(var _loc6_ in HeroModel.ins.teamHeroArr)
            {
               if(_loc6_.heroData != null)
               {
                  if(!_loc5_.containsKey(_loc6_.heroData.id))
                  {
                     _loc2_.push(_loc6_);
                  }
               }
            }
            this.heroList.dataSource = _loc2_;
         }
         else
         {
            _loc5_ = HCModel.ins.GetUsedTargetHero();
            var _loc10_:int = 0;
            var _loc9_:* = OtherRoleInfoModel.ins.teamHeroArr;
            for each(var _loc4_ in OtherRoleInfoModel.ins.teamHeroArr)
            {
               if(_loc4_.heroData != null)
               {
                  if(!_loc5_.containsKey(_loc4_.heroData.id))
                  {
                     _loc2_.push(_loc4_);
                  }
               }
            }
            this.heroList.dataSource = _loc2_;
         }
         this.txt_desc.visible = false;
         if(_loc2_.length == 0)
         {
            this.txt_desc.text = LocaleMgr.ins.getStr(11700027);
            this.txt_desc.visible = true;
         }
         var _loc12_:int = 0;
         var _loc11_:* = this.heroList.cells;
         for each(var _loc3_ in this.heroList.cells)
         {
            _loc3_.idx = this.idx;
         }
      }
   }
}
