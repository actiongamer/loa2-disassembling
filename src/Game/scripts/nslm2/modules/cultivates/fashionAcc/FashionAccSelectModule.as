package nslm2.modules.cultivates.fashionAcc
{
   import game.ui.fashionAcc.FashionAccSelectModuleUI;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS3;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.components.PanelBgS3;
   import nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class FashionAccSelectModule extends FashionAccSelectModuleUI
   {
       
      
      private var voDict:DictHash;
      
      public function FashionAccSelectModule()
      {
         voDict = new DictHash();
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.list_acc.dataSource = [];
         var _loc4_:int = 0;
         var _loc3_:* = StcMgr.ins.getFashionSynTable().array;
         for each(var _loc2_ in StcMgr.ins.getFashionSynTable().array)
         {
            if(BagModel.ins.getStcCount(_loc2_.item) == 0)
            {
               if(_loc2_.itemType && voDict.containsKey(_loc2_.itemType))
               {
                  if(_loc2_.kind == 1)
                  {
                     voDict.getValue(_loc2_.itemType).push(_loc2_);
                  }
               }
               else if(_loc2_.kind == 1)
               {
                  voDict.put(_loc2_.itemType,[_loc2_]);
               }
            }
         }
         if(voDict.array.length == 0)
         {
            this.txt_all.visible = true;
         }
         else
         {
            this.txt_all.visible = false;
         }
         (this.pageBarUI as PageBarS3).btn_down.bottom = (this.pageBarUI as PageBarS3).btn_down.bottom + 68;
         (this.pageBarUI as PageBarS3).bindList(list_title);
         list_title.selectHandler = titleHandler;
         this.list_title.dataSource = voDict.keySet();
         this.list_title.selectedIndex = 0;
         this.panelBg.titleImgId = this.moduleId;
         this.btn_select.label = LocaleMgr.ins.getStr(41500032);
         (this.panelBg as PanelBgS3).img_frame.bottom = 5;
         titleHandler();
         this.btn_select.clickHandler = selectHandler;
         super.preShowCpl();
      }
      
      private function titleHandler() : void
      {
         this.list_acc.dataSource = voDict.getValue(voDict.keySet()[this.list_title.selectedIndex]);
      }
      
      private function selectHandler() : void
      {
         var _loc1_:* = null;
         if(list_acc.selectedItem)
         {
            FashionAccModel.ins.curFashionAccId = (list_acc.selectedItem as StcFashionSynVo).id;
            _loc1_ = StcMgr.ins.getItemVo((list_acc.selectedItem as StcFashionSynVo).item);
            AlertUtil.float(LocaleMgr.ins.getStr(31200008,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc1_.name),ColorLib.qualityColor(_loc1_.quality))]));
         }
         ObserverMgr.ins.sendNotice("refresh_acc");
         btnCloseHandler();
      }
   }
}
