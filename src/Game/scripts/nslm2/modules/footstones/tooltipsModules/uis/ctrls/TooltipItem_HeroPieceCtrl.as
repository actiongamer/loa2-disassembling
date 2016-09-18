package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_HeroPiece;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   import morn.core.utils.StringUtils;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipSellPrice;
   import nslm2.utils.WealthUtil;
   
   public class TooltipItem_HeroPieceCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipItem_HeroPieceCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         super(param1);
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param2.heroPiece_stcNpcId);
         ui.box.addChild(new TooltipIconAndName_HeroPiece(UrlLib.headIcon(param2.heroPiece_stcNpcId.toString()),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(5000 + _loc3_.career_id),BagModel.ins.getStcCount(param2.id),int(param2.extend_1),UrlLib.npcGroupImg(_loc3_.group),LocaleMgr.ins.getStr(5100 + _loc3_.group)));
         ui.addTxt(LocaleMgr.ins.getStr(param2.desc));
         _loc3_ = StcMgr.ins.getNpcVo(int(param2.extend_2));
         if(_loc3_)
         {
            ui.parts.push(new TooltipNpcSkillCtrl(ui,_loc3_));
         }
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         ui.box.addChild(new TooltipGetPoinsDesc(int(param2.get_point_des)));
         ui.addVGap(10);
         ui.addLine();
         ui.addVGap(10);
         if(!StringUtils.isNull(param2.sell_price))
         {
            ui.box.addChild(new TooltipSellPrice(WealthUtil.parseCostStr(param2.sell_price)));
         }
         else
         {
            ui.addTxt(LocaleMgr.ins.getStr(10000002),7566195);
         }
      }
   }
}
