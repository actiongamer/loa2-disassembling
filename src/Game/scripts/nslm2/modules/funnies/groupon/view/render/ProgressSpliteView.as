package nslm2.modules.funnies.groupon.view.render
{
   import game.ui.groupon.render.ProgressSplitViewUI;
   import nslm2.modules.funnies.groupon.vo.DiscountVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.RTools;
   import com.mz.core.configs.ClientConfig;
   
   public class ProgressSpliteView extends ProgressSplitViewUI
   {
       
      
      private var _data:DiscountVo;
      
      public function ProgressSpliteView()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as DiscountVo;
         if(_data)
         {
            txt_cnt.text = LocaleMgr.ins.getStr(999001115,[_data.activateCount]);
            txt_rate.text = RTools.getZheKou(_data.discount / 10) + (!!ClientConfig.isChineseLang()?"":"%") + LocaleMgr.ins.getStr(30000703);
            img_split.visible = _data.showSplit;
         }
      }
   }
}
