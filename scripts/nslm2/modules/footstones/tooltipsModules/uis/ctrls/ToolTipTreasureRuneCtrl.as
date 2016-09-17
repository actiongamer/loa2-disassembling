package nslm2.modules.footstones.tooltipsModules.uis.ctrls
{
   import proto.BaoWu;
   import proto.BaoWuFumo;
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS1;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.ToolTipRuneRender;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   
   public class ToolTipTreasureRuneCtrl extends TooltipCtrlBase
   {
       
      
      public function ToolTipTreasureRuneCtrl(param1:TooltipUICommon, param2:BaoWu)
      {
         var _loc4_:* = null;
         var _loc12_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         super(param1);
         var _loc7_:StcItemVo = StcMgr.ins.getItemVo(param2.baseId);
         ui.img_bg.skin = SkinLib.changeSkinNum_underline(ui.img_bg.skin,_loc7_.quality);
         var _loc5_:Array = param2.fumo;
         _loc5_.sortOn("place");
         var _loc10_:int = _loc5_.length;
         var _loc9_:Array = [];
         _loc12_ = 0;
         while(_loc12_ < _loc10_)
         {
            _loc6_ = _loc5_[_loc12_];
            if(_loc6_.id)
            {
               _loc4_ = WealthUtil.stcItemIdToHadWealthVoArr(_loc6_.id);
               _loc9_.push([_loc4_,param2.fuwenkeyin,param2.baseId]);
            }
            _loc12_++;
         }
         if(checkHasRune(param2))
         {
            ui.box.addChild(new TooltipTitleListPanelS1(LocaleMgr.ins.getStr(30600012),16046112,_loc9_,ToolTipRuneRender));
         }
         var _loc11_:Array = [];
         _loc8_ = StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(param2.baseId).quality,param2.fuwenkeyin]);
         if(_loc8_ != null)
         {
            _loc11_ = NpcPropVo.addProp(_loc11_,NpcPropVo.parseArrStr(_loc8_.normal_attr));
            _loc3_ = new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(30616016),_loc11_,null,1);
            _loc3_.txt_title.color = 16046112;
            _loc3_.txt_title.bold = true;
            ui.box.addChild(_loc3_);
            ui.box.height = ui.box.height + (_loc11_.length - 3) * 20;
         }
      }
      
      private function checkHasRune(param1:BaoWu) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.fumo;
         for each(var _loc2_ in param1.fumo)
         {
            if(_loc2_.id > 0)
            {
               return true;
            }
         }
         return false;
      }
   }
}
