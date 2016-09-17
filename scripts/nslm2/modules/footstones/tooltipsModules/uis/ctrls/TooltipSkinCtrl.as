package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipIconAndName_itemNormal;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import game.ui.roleInfos.NpcPropVo;
   
   public class TooltipSkinCtrl extends TooltipCtrlBase
   {
       
      
      public function TooltipSkinCtrl(param1:TooltipUICommon, param2:StcItemVo)
      {
         super(param1);
         param1.box.addChild(new TooltipIconAndName_itemNormal(UrlLib.itemIcon(param2.icon),param2.quality,LocaleMgr.ins.getStr(param2.name),LocaleMgr.ins.getStr(8000 + param2.kind),0));
         param1.addVGap(10);
         var _loc3_:String = !!SkinModel.ins.isActive(param2.id)?TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200013),new TextFormat(null,null,458496)):!!SkinModel.ins.canActive(param2.id)?TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200014),new TextFormat(null,null,458496)):TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30200002),new TextFormat(null,null,16046112));
         param1.addTxt(_loc3_);
         param1.addVGap(10);
         param1.box.addChild(new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(10220000),NpcPropVo.parseItemVo(param2)));
         param1.addVGap(10);
         param1.parts.push(new TooltipSkinSuitCtrl(param1,param2));
         param1.addVGap(10);
         param1.parts.push(new TooltipItemCommonCtrl(param1,param2));
      }
   }
}
