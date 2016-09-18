package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RuneCategoryRenderUI;
   import nslm2.modules.cultivates.treasure.vo.RuneCategoryVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class RuneCategoryRender extends RuneCategoryRenderUI
   {
       
      
      private var _data:RuneCategoryVo;
      
      public function RuneCategoryRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as RuneCategoryVo;
         .super.dataSource = param1;
         if(_data)
         {
            if(_data.type == 0)
            {
               txt_name.text = LocaleMgr.ins.getStr(999000094);
               var _loc2_:int = 40;
               img_icon.height = _loc2_;
               img_icon.width = _loc2_;
            }
            else
            {
               txt_name.text = LocaleMgr.ins.getStr(30600100 + _data.type) + LocaleMgr.ins.getStr(999000095);
            }
            if(_data.count > 0)
            {
               txt_num.text = TextFieldUtil.htmlText2("（" + _data.count + "）",458496);
            }
            else
            {
               txt_num.text = "";
            }
            img_icon.url = UrlLib.runeTypeIcon(_data.type);
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               selectBox1.visible = false;
               break;
            case 1:
               selectBox1.visible = true;
               break;
            case 2:
               selectBox1.visible = true;
         }
      }
   }
}
