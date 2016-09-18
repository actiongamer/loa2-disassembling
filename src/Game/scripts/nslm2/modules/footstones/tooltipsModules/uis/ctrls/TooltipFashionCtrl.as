package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_itemNormal;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import game.ui.roleInfos.NpcPropVo;
   
   public class TooltipFashionCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipFashionCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         super(param1);
         ui.box.addChild(new TooltipIconAndName_itemNormal(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),0));
         ui.addVGap(10);
         var _loc3_:String = !!FashionModel.ins.hasActivatedFashion(param2.id)?TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200013),new TextFormat(null,null,458496)):!!FashionModel.ins.canActivate(param2.id)?TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200014),new TextFormat(null,null,458496)):TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200002),new TextFormat(null,null,16046112));
         ui.addTxt(_loc3_);
         ui.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(10220000),NpcPropVo.parseItemVo(param2),null,true));
         ui.parts.push(new TooltipFashionSuitCtrl(param1,param2));
         ui.addVGap(10);
         ui.parts.push(new TooltipItemCommonCtrl(ui,param2));
      }
   }
}
