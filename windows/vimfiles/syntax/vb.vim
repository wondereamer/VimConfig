" Vim syntax file
" Language:	zjt
" Maintainer:	WDJ <dingjie.wang@gmail.com>
" Last Change:	2009 Nov 17

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
":syntax list {group-name}
syntax case ignore
"syntax case match

syn keyword xFun Table Table.RowCount Table.ColCount Table.Name Table.BlockName Table.BlockType Table.ItemType Table.GetItemText Table.GetItemValue Table.SetItemText Table.SetItemValue Table.Refurbish Table.SortCol Table.SwitchBlock Table.ClearAllSelected Table.SetSelectedRow Table.EnsureVisible Table.GetReportData Table.GetGrid MinuteData ReportData.Count ReportData.OpenInt ReportData.NewPrice ReportData.Volume ReportData.Amount ReportData.Date ReportData.ASKPRICE ReportData.ASKVOL ReportData.BIDPRICE ReportData.BIDVOL ReportData.IsBuy Order Order.Holding Order.Holding2 Order.OrderNum Order.OrderNum2 Order.TradeCount Order.TradeCount2 Order.HedgeFlagType Order.IBACCount Order.CTPAcCount Order.OrderQueue Order.Account Order.Account2 Order.Buy Order.Sell Order.BuyShort Order.SellShort Order.CancelOrder Order.HoldingInfo Order.HoldingInfo2 Order.HoldingInfoByCode Order.HoldingInfoByCode2 Order.OrderInfo Order.OrderInfoByCode Order.OrderInfo2 Order.OrderInfoByCode2 Order.Contract Order.StockType Order.ChargeByNum Order.TradeDetalied Order.TradeDetalied2 Order.IBAccountName Order.CTPAccountName Order.IsAccount Order.HoldingRefurbish Order.ModifyPassword Order.QuitAccount Order.UpdateHolding Order.OrderStatus Order.OrderStatusEx Order.OrderStatusEx2 Order.PleaceOrder Order.ModifyPasswordNotify Network Network.UserCount Network.Port Network.ServerState Network.Create Network.StopServer Network.UserRemove Network.UserType Network.UserSend Network.UserName Network.UserIp Network.UserLoginTime Network.UserValidate Network.RequestFormula Network.UserLogin Network.UserReceive Network.ReceiveType MinuteData MinuteData.Count MinuteData.OpenInt MinuteData.NewPrice MinuteData.Volume MinuteData.Amount MinuteData.Date MinuteData.ASKPRICE MinuteData.ASKVOL MinuteData.BIDPRICE MinuteData.BIDVOL MinuteData.IsBuy Menu Menu.Count Menu.AddMenu Menu.AddPopupMenu Menu.CheckMenuItem Menu.GetMenuState MarketData MarketData.AutoClose MarketData.AutoDistillBase MarketData.BasePath MarketData.NewsPath MarketData.DynamicPath MarketData.MainPath MarketData.RenewBase MarketData.RenewDay MarketData.RenewMinute MarketData.RenewPower MarketData.MarketCount MarketData.GetReportData MarketData.GetReportCount MarketData.GetReportDataByIndex MarketData.GetMinuteData MarketData.GetHistoryData MarketData.GetMarketInfo MarketData.GetMarketInfo2 MarketData.GetFincance MarketData.AddStock MarketData.IsExistStock MarketData.GetMarketByIndex MarketData.RegReportNotify MarketData.UnRegReportNotify MarketData.Stkindi MarketData.StkDataOK MarketData.StartReceive MarketData.StopReceive MarketData.StockAlarm MarketData.ReportNotify MarketData.AlarmStart MarketData.AlarmStop MarketData.AlarmPleaceOrder Market Market.Name Market.Id Market.IndexCode Market.PYSupport Market.TimeZone Market.RotativeBargain Market.BigVolume Market.TypeGroupCount Market.TypeGroupName Market.TypeGroupFrom Market.TypeGroupTo Market.TypeGroupDecimal Market.TypeGroupType Market.TypeGroupStockOfVol Market.TypeGroupUpStop Market.TypeGroupDownStop Market.TypeGroupPriceType Market.TypeGroupStat Market.GarbageCodeCount Market.GarbageCodeFrom Market.GarbageCodeTo Market.OpenTime Market.CloseTime Market.TradeSeconds Market.OpenSeconds Market.TimeSectCount Market.TimeSectStart Market.TimeSectEnd HistoryData HistoryData.Count HistoryData.Open HistoryData.High HistoryData.Date HistoryData.Low HistoryData.Close HistoryData.Volume HistoryData.Amount HistoryData.Advance HistoryData.Decline HistoryData.Qt HistoryData.Openint HistoryData.OpenV HistoryData.OpenA HistoryData.SaveData HistoryData.InsertAt HistoryData.RemoveAt HistoryData.GetPosFromDate GridFont GridFont.Name GridFont.Size GridFont.Bold GridFont.Italic GridFont.Underline GridFont.Strikethrough GridFont.Weight GridFont.Charset Grid Grid.CycType Grid.DataType Grid.Type Grid.ShowCyc Grid.ShowStartIndex Grid.ShowLastCyc Grid.YAxis Grid.XAxis Grid.ShowXLine Grid.ShowYLine Grid.SyncAxis Grid.FormulaCount Grid.MaxPrice Grid.MinPrice Grid.BackColor Grid.Width Grid.Height Grid.TopHeight Grid.LeftWidth Grid.RightWidth Grid.BottomHeight Grid.CycStep Grid.CoordinateMode Grid.CoordinateType Grid.CooridateXType Grid.CooridateXTime Grid.IgnoreKeyMsg Grid.Name Grid.StockName Grid.StockLabel Grid.Market Grid.IndexData Grid.ShowButton Grid.MinuteGraph Grid.MustPower Grid.PowerAspect Grid.SpliceCount Grid.GetSpliceGrid Grid.SpliceType Grid.ShowBandPrice Grid.PriceReversal Grid.CoordReversal Grid.IsKXianBD Grid.MainGraphType Grid.LockStock Grid.LockTimeSect Grid.LockTimeSectStart Grid.LockTimeSectEnd Grid.LockTodayTimeSect Grid.LockYCoordinate Grid.OrderMode Grid.DataCount Grid.ShowCount Grid.StartShowIndex Grid.LastDataCount Grid.MaxLoadCount Grid.ReInitData Grid.ReInitDataFormula Grid.ReInitFormula Grid.GetMainGrid Grid.GetFont Grid.GetListFont Grid.SetFont Grid.SetListFont Grid.GetReportData Grid.GetMinuteData Grid.GetHistoryData Grid.GetMarketInfo Grid.GetParentFrameName Grid.DRAWICON Grid.DrawLine Grid.DRAWTEXT Grid.DRAWFONTTEXT Grid.DrawEllipse Grid.InvertRect Grid.DrawArc Grid.DrawRect Grid.DrawStick Grid.DrawBmp Grid.DrawBmpRect Grid.PriceToPels Grid.ValueByPoint Grid.DateByPos Grid.PosByDate Grid.DateByPoint Grid.PelsByPos Grid.GetFormulaByIndex Grid.GetFormulaByName Grid.InsertFormula Grid.DeleteFormula Grid.FrameToGird Grid.GridToFrame Grid.PtInGrid Grid.IsWindow Grid.ChangeStock Grid.ChangeCyc Grid.IsTable Grid.GetGrid Function Function.GetForecast Function.GetSlope Function.Max Function.Min Function.NormSDist Function.NORMSINV Function.DRL Function.BINOMDIST Function.GEOMEAN Function.HARMEAN Function.KURT Function.PEARSON Function.RSQ Function.STEYX Function.SKEW Function.INTERCEPT Function.EXPONDIST Function.COMBIN Function.HYPGEOMDIST Function.STANDARDIZE Function.PERMUT Function.POISSON Function.WEIBULL Function.TRMA Function.IMA Frame Frame.AutoRedraw Frame.Name Frame.Description Frame.CreateTime Frame.OwnerName Frame.GridCount Frame.SplitterBarColor Frame.GridFocusColor Frame.EnableDragSpliterBar Frame.Enable3DSpliterBar Frame.EnableShowFocus Frame.NewDocument Frame.HasVisible Frame.ShowKeyFairy Frame.Splitter Frame.ActiveGrid Frame.SaveDocument Frame.SaveAsDocument Frame.AddGrid Frame.AddGridByName Frame.GetGridByIndex Frame.GetGridByName Frame.GetFormulaByName Frame.ReCalcAllGrid Frame.InitAllGrid Frame.ReCalcAllGridFromula Frame.GetGridByPt Frame.Refresh Frame.SPLITERCHANGE Frame.Load Frame.Close Frame.FocusChange Frame.Zoom Frame.Activate Frame.Deactivate Frame.GotFocus Frame.Initialize Frame.Unload Frame.Save Frame.SaveAs Frame.QueryUnload Frame.Paint Frame.PaintBefore Frame.Click Frame.DblClick Frame.KeyDown Frame.KeyUp Frame.KeyPress Frame.MouseDown Frame.MouseUp Frame.MouseMove Frame.AddFormula Frame.RemoveFormula Frame.CursorMove Frame.ChangeStock Frame.TableChangeStock Frame.TableClickStock Frame.TableSortOk Frame.ClickHeader Frame.TableInited Frame.RefurbishFinished Frame.CalcGridMaxMin Frame.CalcData Frame.CalcDataed Frame.StartTarder Frame.EndTarder Formula Formula.Name Formula.MaxPrice Formula.MinPrice Formula.Type Formula.Cascade Formula.TitleTop Formula.TitleHeight Formula.DataSize Formula.LineCount Formula.WorkMode Formula.IndexData Formula.IsLastBar Formula.ParentGrid Formula.GetBufData Formula.GetBufDateData Formula.GetBufDataByIndex Formula.VarData Formula.VarStartIndex Form Form.BackColor Form.BorderColor Form.BorderStyle Form.Caption Form.Cycle Form.Enabled Form.Font Form.ForeColor Form.KeepScrollBarsVisible Form.MouseIcon Form.PictureAlignment Form.Picture Form.PictureSizeMode Form.Zoom Form.ScrollBars Form.ScrollHeight Form.ScrollWidth Form.ScrollLeft Form.ScrollTop Form.SpecialEffect Form.VerticalScrollBarSide Form.MinButton Form.MaxButton Form.PictureTiling Form.InsideHeight Form.InsideWidth Form.Visible Form.ShowModal Form.Resizing Form.Left,Top Form.Height,Width Form.Repaint Form.Scroll Form.SetDefaultTabOrder Form.Move Form.Show Form.EndForm Form.SetTitileIcon Form.Load Form.UnLoad Form.Initialize Form.Activate Form.Deactivate Form.QueryUnload Form.Click Form.DblClick Form.KeyDown Form.KeyUp Form.KeyPress Form.MouseDown Form.MouseUp Form.MouseMove Document Document.DocName Document.DocPath Document.OpenDoc Document.CloseDoc Document.GetExtData Document.SetExtData Document.GetExtString Document.SetExtString Document.ClearExtData Document.GetPrivateProfileFloat Document.WritePrivateProfileFloat Document.GetPrivateProfileString Document.WritePrivateProfileString Document.GetPrivateProfileInt Document.WritePrivateProfileInt Document.DebugFile Document.OnClose Document.OnLoad Application Application.AppName Application.AppPath Application.Visible Application.Version Application.NoShowTipDlg Application.UserName Application.LastCycCalc Application.Left,Top Application.Height,Width Application.EnginCode Application.ReceiveDataStatus Application.UserType Application.DoWaitCursor Application.WinExec Application.system Application.ShellExecute Application.ActivateFrame Application.IsActivateFrame Application.GetActiveGrid Application.GetActiveFrameName Application.GetCurrentStock Application.ActivateFrameWithCode Application.SetTimer Application.KillTimer Application.SendMessage Application.PostMessage Application.Register Application.PlaySoundFile Application.StopPlay Application.EnableWindow Application.ShowWindow Application.ReceiveData Application.MsgOut Application.ClearMsg Application.PeekAndPump Application.Start Application.Close Application.Timer Application.VBAStart Application.OnKeyDown Application.OnKeyUp Agent Agent.Show Agent.ShowAgentPropertySheet Agent.Play Agent.StopAll Agent.MoveTo Agent.IsVisible Agent.Position Agent.Speak IsNumeric IsDate IsEmpty IsArray IsError IsNull IsObject Sin Cos Tan Atan Log Exp Abs Int Fix Sgn Sqr VarType Rnd Trim Ltrim Rtrim Len Left Right Mid Ucase Lcase Space Asc Chr CBool CByte CCur CDate CDbl CDec CInt CLng CSng CStr CVar Val Str Now Date Time Timer TimeSerial DateDiff Second Minute Hour Day Month Year Weekday Dir Kill RmDir Open Input Get Write Print Put Close LOF EOF Loc Seek InStrRev InStr MsgBox Array Array.Count Array.AddBack Array.InsertAt Array.RemoveAt Array.RemoveAll Array.GetAt Array.SetAt Array.SetSize Array.Sort Array.Copy Array.Find Array.EquCount Array.Equal Array.Swap Array.Replace Array.Fill Array.Remove Array.Unique Array.Reverse Array.Search Array.Max Array.Min Array.Average Array.AllCount Array.Alike Array.Releate Array.Avedev Array.Covar Array.Devsq Array.Forcast Array.Slope Array.Std Array.Stdp Array.Var Array.Varp UBound LBound debug info




syn keyword	xStatement Not And Or Xor Eqv Imp String Byte Boolean Integer Long Single Double Date Decimal Variant Object Dim Private Public Global Static Const Set If Else Then Select End Choose Switch For Next Each Do Goto While Wend On Error Sub Function Loop Case Exit Preserve Redim As False True With To Nothing


syntax keyword xTodo TODO contained
syntax match xComment /'.*/    contains=xTodo
"syntax region xString start=/"/ skip=/\\"/ end=/"/ 
syntax region xString start=/"/  end=/"/ 
"syntax region xBlock start=/{/ end=/}/ contains=xBlock
" display the begin and end with another way
"syntax region xInside matchgroup=xComment start=/(/ end=/)/


hi link xComment    Special
hi link xStatement  Keyword
hi link xTodo       Error
hi link xString     String
hi link xFun        Comment

let b:current_syntax = "zjt"
