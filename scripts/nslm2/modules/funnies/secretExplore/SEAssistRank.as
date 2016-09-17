package nslm2.modules.funnies.secretExplore
{
   import game.ui.secretExplore.SEAssistRankUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.nets.sockets.ServerEngine;
   import proto.MjtxRankRes;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class SEAssistRank extends SEAssistRankUI
   {
       
      
      public function SEAssistRank()
      {
         super();
         this.list_item.itemRender = SEAssistRankRender;
         this.btn_reward.clickHandler = rewardClick;
         this.img_bg.url = UrlLib.secretUrl("img_rank_bg.png");
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50700109);
         this.btn_reward.visible = false;
         this.list_item.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
      }
      
      private function rewardClick() : void
      {
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         this.txt_info.text = LocaleMgr.ins.getStr(50700111) + "：" + TextFieldUtil.htmlText2(SEModel.ins.info.assistCount,11137387);
         ServerEngine.ins.send(8601,null,onRet);
         this.txt_info1.text = LocaleMgr.ins.getStr(50700123);
      }
      
      private function onRet(param1:MjtxRankRes) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = undefined;
         if(param1 == null)
         {
            param1 = new MjtxRankRes();
         }
         if(param1.info == null)
         {
            param1.info = [];
         }
         var _loc2_:Array = [];
         var _loc5_:int = 1;
         while(true)
         {
            _loc4_ = getItem(_loc5_);
            if(_loc4_ != null)
            {
               _loc3_ = param1.info.length > 0?param1.info.shift():null;
               _loc2_.push({
                  "rank":_loc5_,
                  "info":_loc3_,
                  "reward":_loc4_
               });
               _loc5_++;
               continue;
            }
            break;
         }
         this.list_item.repeatY = _loc2_.length;
         this.list_item.array = _loc2_;
      }
      
      private function getItem(param1:int) : *
      {
         var _loc2_:* = null;
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",15);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            _loc2_ = _loc4_.rank.split(":");
            if(param1 >= int(_loc2_[0]) && param1 <= int(_loc2_[1]))
            {
               return _loc4_;
            }
         }
         return null;
      }
   }
}
