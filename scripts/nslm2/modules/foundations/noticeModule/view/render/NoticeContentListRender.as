package nslm2.modules.foundations.noticeModule.view.render
{
   import game.ui.noticeModules.NoticeContentRenderUI;
   import nslm2.modules.foundations.noticeModule.vo.NoticeVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   
   public class NoticeContentListRender extends NoticeContentRenderUI
   {
       
      
      private var _data:NoticeVo;
      
      public function NoticeContentListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = 0;
         _data = param1 as NoticeVo;
         if(_data)
         {
            this.txt_content.text = _data.content;
            _loc2_ = (ServerTimer.ins.second - _data.timeStamp) / 60;
            if(_loc2_)
            {
               this.txt_time.text = LocaleMgr.ins.getStr(999000320,[TimeUtils.getOffLineTime((ServerTimer.ins.second - _data.timeStamp) / 60)]);
            }
            else
            {
               this.txt_time.text = LocaleMgr.ins.getStr(999000321);
            }
            txt_time.y = txt_content.textHeight + 4;
            img_line.y = txt_time.y + 20;
         }
      }
      
      override public function get height() : Number
      {
         return img_line.y + 6;
      }
   }
}
