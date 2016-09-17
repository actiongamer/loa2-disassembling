package nslm2.modules.funnies.teamGuajiScenes.pvp.pieceBag
{
   import game.ui.teamGuajiScenes.pvp.TreasurePieceListRenderUI;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.TextFieldUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class TreasurePieceListRender extends TreasurePieceListRenderUI
   {
       
      
      private var _data:WealthVo;
      
      private var _dropLayer:int;
      
      public function TreasurePieceListRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1;
         if(btn_compose !== _loc3_)
         {
            if(btn_rob === _loc3_)
            {
               if(TeamGuajiService.ins.sceneInfo.curGuajiId == _dropLayer)
               {
                  ModuleMgr.ins.showModule(41219);
               }
               else
               {
                  _loc2_ = TeamGuajiService.ins.sceneInfo.maxPassedGuajiId;
                  if(_dropLayer > _loc2_ + 1)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(41300253));
                  }
                  else
                  {
                     AlertUtil.comfirm(LocaleMgr.ins.getStr(41300254),yesHandler,null,"goNextFloor");
                  }
               }
            }
         }
         else
         {
            ModuleMgr.ins.showModule(41218,_data,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function yesHandler() : void
      {
         var _loc1_:int = _data.stcItemVo.extend_3;
         TeamGuajiService.ins.server_set_guajiNandu(changeNanduSuccess,_loc1_);
      }
      
      private function changeNanduSuccess() : void
      {
         ModuleMgr.ins.closeModule(41219);
         TweenLite.delayedCall(0.8,ModuleMgr.ins.showModule,[41219]);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         _data = param1 as WealthVo;
         if(_data)
         {
            this.pieceRender.dataSource = param1;
            this.txt_name.color = ColorLib.qualityColor(_data.quality);
            this.txt_name.text = _data.showName;
            this.txt_des.text = LocaleMgr.ins.getStr(_data.stcItemVo.desc);
            _loc2_ = _data.stcItemVo.extend_1;
            _loc4_ = PlayerModel.ins.getCountByWealthVo(_data);
            if(_loc4_ >= _loc2_)
            {
               _loc3_ = 458496;
            }
            else
            {
               _loc3_ = 16723968;
            }
            txt_haveCnt.text = TextFieldUtil.htmlText2("（" + _loc4_ + "/" + _loc2_ + "）",_loc3_);
            _dropLayer = int(_data.stcItemVo.extend_3);
            if(_dropLayer == TeamGuajiService.ins.sceneInfo.curGuajiId)
            {
               img_crtFloor.visible = true;
            }
            else
            {
               img_crtFloor.visible = false;
            }
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         this.img_selected.visible = param1 == 2 || param1 == 3;
      }
   }
}
