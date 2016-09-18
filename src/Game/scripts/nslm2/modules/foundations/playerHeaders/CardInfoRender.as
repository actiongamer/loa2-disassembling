package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.CardInfoRenderUI;
   import proto.CardInfo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class CardInfoRender extends CardInfoRenderUI
   {
       
      
      private var ori_img_quality_url:String;
      
      private var _textCdCtrl:TextCDCtrlS2;
      
      public function CardInfoRender()
      {
         super();
      }
      
      public function get vo() : CardInfo
      {
         return this.dataSource as CardInfo;
      }
      
      public function get stcItemVo() : StcItemVo
      {
         if(vo)
         {
            return StcMgr.ins.getItemVo(this.vo.itemId);
         }
         return null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.vo)
         {
            ori_img_quality_url = this.img_quality.url.substr(0,this.img_quality.url.length - 1);
            if(stcItemVo)
            {
               this.img_icon.url = UrlLib.itemIcon(stcItemVo.icon);
               this.img_quality.url = ori_img_quality_url + stcItemVo.quality;
            }
            this.toolTip = this.stcItemVo;
            if(vo.endStamp)
            {
               if(_textCdCtrl == null)
               {
                  _textCdCtrl = new TextCDCtrlS2(txt_desc,textCdFormat,textCdCpl);
                  this.parts.push(new TextCDCtrlS2(txt_desc,textCdFormat,textCdCpl));
               }
               _textCdCtrl.start(vo.endStamp);
            }
            if(vo.residualTimes)
            {
               this.txt_desc.text = LocaleMgr.ins.getStr(999000328,[vo.residualTimes]);
            }
         }
      }
      
      private function textCdFormat(param1:int) : String
      {
         return TimeUtils.oneCN(param1);
      }
      
      private function textCdCpl() : void
      {
         ObserverMgr.ins.sendNotice("MSG_CARD_INFO_CHANGED");
         if(_textCdCtrl)
         {
            _textCdCtrl.dispose();
            _textCdCtrl = null;
         }
      }
   }
}
