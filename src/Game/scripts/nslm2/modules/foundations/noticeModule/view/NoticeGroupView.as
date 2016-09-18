package nslm2.modules.foundations.noticeModule.view
{
   import game.ui.noticeModules.NoticeGroupViewUI;
   import nslm2.modules.foundations.noticeModule.vo.NoticeGroupVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.noticeModule.vo.NoticeVo;
   import nslm2.modules.foundations.noticeModule.view.render.NoticeContentListRender;
   
   public class NoticeGroupView extends NoticeGroupViewUI
   {
       
      
      private var _data:NoticeGroupVo;
      
      private var renders:Array;
      
      public function NoticeGroupView()
      {
         renders = [];
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as NoticeGroupVo;
         if(_data)
         {
            if(_data.type == 2)
            {
               this.tilteBar.txt_name.text = LocaleMgr.ins.getStr(999000324);
            }
            else
            {
               this.tilteBar.txt_name.text = LocaleMgr.ins.getStr(999000325);
            }
            updateConents(_data.contentArr);
         }
      }
      
      private function updateConents(param1:Array) : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:int = param1.length;
         var _loc3_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _data.contentArr[_loc5_];
            _loc6_ = renders[_loc5_];
            if(!_loc6_)
            {
               _loc6_ = new NoticeContentListRender();
               contentBox.addChild(_loc6_);
               renders[_loc5_] = _loc6_;
            }
            _loc6_.dataSource = _loc2_;
            _loc6_.y = _loc3_;
            _loc3_ = _loc3_ + (_loc6_.height + 2);
            _loc5_++;
         }
         changeSize();
      }
      
      override public function get height() : Number
      {
         return contentBox.y + contentBox.height;
      }
   }
}
