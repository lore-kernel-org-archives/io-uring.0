Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793303332;
	b=Cj8KhJN32JaORNA62eCZUVZpi4dBmBntBN/0xKZ4BCpD4UbgsH5pe+MhUm+rTQOS60Ia
	 LRKHf8IgjfSkwcO5Qb2lBfFDerzJy2cw/oFpRK/yC0FomHI5zm7ef25fFBb7jGiQkcl4W
	 r7aQsxhkVVqqagOqvNDBTuxcAW2ZwE6dEsH1pORX9uYHlz9ShMFziBGJTIr76PEKr1xBO
	 tlF+0LEOFLZtr5hw0FW+2fLW6tD/V8VKEKfxMn0PaZ668L3UY9kp8sril1nlq/xss59Bj
	 MHWNNZjY/Si7NveO+0Bi+iI98Sh+hxxsPXtF9e88JaaZQKn/p+EnitU2cFjB0+RE7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793303332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To;
	bh=oJaBcqMDol+l5KpmQcO+owNvXVbK7GTeemK+QBIDdL8=;
	b=mNhB1zyT+EC3vTxjQzAlE//uZLLmpj6eAZMekfOWCfM6GfSKoV3Xq068OdZc8sUsYLdU
	 fZGRyksDrhrcvq46B1PDn+4deQr0/cxhMQ/PlKJX09bzCcC9c5ONCfoQWON7ZCsm+DU+G
	 0CkGm8hMiHcl2kBGCYq8NVjeM+rNtXIpyocPJ4fVATZv5L9zANXqy+AmAS9ke63NoC6S7
	 Jgxfujaq3nAEXVG2F/XIrBJuTonvN3R5+d6SUqJgcdqtJtcCuWZTwGqB1pqS/7Mb9OYSx
	 J8Hpy6m7bTvpvj/sgdwXwq7uhcvF9sFcr3YK2haDFCqdrk0sy31IloJAPzdt5ldpjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nqJB4AT8;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60A606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 19:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B60A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nqJB4AT8
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-82109f51565so14453a34.2
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793303330; x=1793908130; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oJaBcqMDol+l5KpmQcO+owNvXVbK7GTeemK+QBIDdL8=;
        b=nqJB4AT8491IsEbVUDASNt59o2hi5b0jE7+/RdXDg5T7KG3GgqQHT9I1NwnCIYaOPJ
         IlkiCXpWgdERTxs3jcLmGi41oOTQbAc456Z+AOVbjjfdY2qC8yUQSC1yB1YUIsxslpSF
         NxbbnJYnRqf9Sq6pzi5MzDNhXFTTOXNRLeN3P2Y1pAIEdzEMcIS6CbrvaPqMfezzL3C1
         webRvj8EQf0aDz8FySOn+d6IQHryBCVa6oGiIFUNk7XN8XR8Qi5c6ayDFS6ZolkN9GiK
         Cx5Im5DKUOAHZrae+7wTp5KFYUsiNmP0vP72xgzxNz5Kdc+tOi1ngRFd89Bw84H+YfzW
         e1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793303330; x=1793908130;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJaBcqMDol+l5KpmQcO+owNvXVbK7GTeemK+QBIDdL8=;
        b=Yc44YsOMeuO0oV/VTxHSr9ZuGrvclgm6pL5hWax+/A2qh+vcwhrTZmaf6Tf5gj4nIm
         xo3PxXkT3nveTVuNn3AHZcIu304v7dMhrchqiDVKl0aMQRhMRfX7+4juQSGIWDZd5uGC
         nauDIzA4rHZL/PqG/HSQrnqJ8Bv/liIYn4zkenAk0379JVV87Bu1+ZNFSYkcmv4jKnsa
         oREm8fYDOPDlhq18/xmlfYIXjqnpBFlbFSTKwJsdy1vsZqbkcDo5LoOj6cYBpU5ixuVx
         jXYuWb+cZp8ER0t94v3ec9mF+Awoo9evXC+4tYclohPS9occzASmrXY+laiE9AqiGSfK
         hyWw==
X-Gm-Message-State: AFq9FYKTqIiMKRQ3woVGgTSHVfkxgahQaIkpUpXypgrhTu4EtFiplj3a
	8kLqYLbadlXnqAqOGc9sEE7xLYmJSOvcc474IAcwrs2Tyxsxu+OI0huQ2cVIfvlrF5mGydNt5eS
	f/7NOXIU=
X-Gm-Gg: AYBFou06bzvtk/ggRglqxlrf6orliNFjjHVzFhpSUPj3536E90QGmzgdRVMau4ZQqHz
	ghbuYbtYq32eBjFL8q7shHFwduHs5GODNNQsYdU9UVsYzJ0DaXgUdDPYiq4/Q/G9hcheUL6KWEK
	aym1vfVlA4hG8WUFAqjfUUGpxcSyJptK+a/YepaC7o/Y1GMZgW5C+/4HSctyzg+kfm9gw1uw1wy
	zDiCV9NqmdC1Kn3WwXIzSEDqeZ46Ww1N7U1HY/hXDe+UMRz/ebYFU3R/qGhECNS0WmMsXW9wZAw
	qKTYF8CwFyr5016e+BpIl8TalR1Tjx6C40YrUjdQOf3JJz26gHod9xXOdZYNUJ82sTGWiOaDLSw
	KLwRhcu0eYPpTfQ+z4HkTKFghnBvomjXHrhnB5ac4gGKvKvFgDlz9olOKy5Ue/FGBRmL8MAgvgX
	haetseetwRvwuTxguBYrvfEdLwLNmrNj2miBeJ+SDwT4fOZvV1X6SsOvU1WcYm1zyYTgjnwJXdj
	PRotaEoYbPUMm37oUebsMxp/LD9g28uw45Ud0R06UY53WhJhVXYDB/JqbryIvtwN1IGoVV64CI4
	zPf+vYeXMqQHI8nKr+4XbdAhUFUigOWJWX/NfdHLWcVKzg5opdMNwh20pMN0dHDqxAB2WvPp32q
	sx6AKh88YDQ==
X-Received: by 2002:a05:6830:3151:b0:7fa:ab72:9df9 with SMTP id 46e09a7af769-85d3652cf22mr225737a34.17.1793303330266;
        Thu, 29 Oct 2026 12:48:50 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e9684sm380892a34.3.2026.10.29.12.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:48:49 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------XhqjskzGhUXkj0mcLeog29bQ"
Message-ID: <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
Date: Thu, 29 Oct 2026 13:48:48 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: io_uring: SENDMSG/WRITEV return -EAGAIN on O_NONBLOCK socket
 after peer half-close
To: =?UTF-8?B?THVrw6HFoSBMYWxpbnNrw70=?= <lukas@lalinsky.com>
Cc: io-uring@vger.kernel.org
References: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <a5589b66-9a20-4b1c-a0f1-1b5b31af3667@app.fastmail.com>

This is a multi-part message in MIME format.
--------------XhqjskzGhUXkj0mcLeog29bQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 12:54 PM, Lukáš Lalinský wrote:
> Hi,
> 
> IORING_OP_SENDMSG can complete with -EAGAIN even though MSG_DONTWAIT
> was not used. It happens when the send is waiting for buffer space, the
> peer calls shutdown(SHUT_WR), and the socket has O_NONBLOCK set.
> 
> IORING_OP_SEND in the same situation keeps waiting and completes
> normally once the peer reads. So does SENDMSG on a socket without
> O_NONBLOCK. IORING_OP_WRITEV behaves the same way as SENDMSG.
> 
> I consider this a bug. Based on previous discussions [1][2], io_uring
> should ignore O_NONBLOCK for operations that take a per-call nonblock
> flag. SENDMSG mostly does: on the full socket the request doesn't fail
> immediately, it waits. It only fails after the peer half-closes. At the
> very least it's inconsistent, because SEND and SENDMSG/WRITEV behave
> differently on the same socket.
> 
> There is no good option for handling the error. Resubmitting fails
> again the same way. Waiting for writability with
> IORING_OP_POLL_ADD(POLLOUT) doesn't work after a half-close either, it
> completes immediately with POLLRDHUP, even though POLLRDHUP wasn't
> requested. The only workarounds are dropping the O_NONBLOCK flag, or
> using a separate epoll to wait for writability.
> 
> If I'm reading the code correctly, after the half-close EPOLLRDHUP
> keeps waking the request's internal poll. The request runs out of
> APOLL_MAX_RETRY and is punted to io-wq, where the blocking attempt goes
> through __sys_sendmsg_sock() -> ____sys_sendmsg(). That function turns
> O_NONBLOCK into MSG_DONTWAIT, so the attempt returns -EAGAIN instead of
> blocking. io_send() calls sock_sendmsg() directly, which is why SEND
> blocks in the worker instead. WRITEV seems to hit the same thing in
> sock_write_iter(), and IORING_OP_RECVMSG through ____sys_recvmsg(),
> after enough wakeups that find no data.
> 
> We hit this in zio, an async runtime for Zig, via an HTTP/2 server's
> half-close tests [3]. ringline, a Rust io_uring runtime, hit it
> independently on 6.12 and 7.1 [4], and libosmocore seems to have hit
> the same -EAGAIN and worked around it by clearing O_NONBLOCK [5]. We'll
> work around it in zio for now.

Can you try with these two patches? I think the problem is two-fold,
each patch tries to reason about that.

-- 
Jens Axboe

--------------XhqjskzGhUXkj0mcLeog29bQ
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-net-leave-O_NONBLOCK-to-the-sendmsg-and-recvmsg-sysc.patch"
Content-Disposition: attachment;
 filename*0="0002-net-leave-O_NONBLOCK-to-the-sendmsg-and-recvmsg-sysc.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiZWJhNmQyMzEzMDIzMjk3MDBjM2E0NTc3N2Q5YzJkYTMyYjA2ZjBiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkRh
dGU6IFRodSwgMjkgT2N0IDIwMjYgMTM6Mzg6MTggLTA2MDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gbmV0OiBsZWF2ZSBPX05PTkJMT0NLIHRvIHRoZSBzZW5kbXNnIGFuZCByZWN2bXNnIHN5
c2NhbGxzCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpfX19fc3lzX3Nl
bmRtc2coKSBhbmQgX19fX3N5c19yZWN2bXNnKCkgdHVybiBPX05PTkJMT0NLIG9uIHRoZSBz
b2NrZXQKaW50byBNU0dfRE9OVFdBSVQuIFRoYXQgaXMgcmlnaHQgZm9yIHRoZSBzeXN0ZW0g
Y2FsbHMsIGJ1dCBpb191cmluZyB1c2VzCl9fc3lzX3NlbmRtc2dfc29jaygpIGFuZCBfX3N5
c19yZWN2bXNnX3NvY2soKSBmb3IgYSBibG9ja2luZyBhdHRlbXB0CmZyb20gaW8td3EgYXMg
d2VsbCwgYWZ0ZXIgdGhlIG5vbi1ibG9ja2luZyBhdHRlbXB0cyB3aXRoIE1TR19ET05UV0FJ
VApoYXZlIGZhaWxlZC4gT24gYW4gT19OT05CTE9DSyBzb2NrZXQgdGhhdCBhdHRlbXB0IGNh
bid0IGJsb2NrIGVpdGhlciBhbmQKdGhlIHJlcXVlc3QgY29tcGxldGVzIHdpdGggLUVBR0FJ
TiwgdW5saWtlIElPUklOR19PUF9TRU5EIGFuZCBSRUNWLAp3aGljaCBjYWxsIHNvY2tfc2Vu
ZG1zZygpIGFuZCBzb2NrX3JlY3Ztc2coKSBkaXJlY3RseSBhbmQgZG9uJ3QgbG9vayBhdApP
X05PTkJMT0NLIGF0IGFsbC4KCk1vdmUgdGhlIE9fTk9OQkxPQ0sgaGFuZGxpbmcgdG8gX19f
c3lzX3NlbmRtc2coKSBhbmQgX19fc3lzX3JlY3Ztc2coKSwKd2hpY2ggdGhlIHNlbmRtc2cs
IHNlbmRtbXNnLCByZWN2bXNnIGFuZCByZWN2bW1zZyBzeXN0ZW0gY2FsbHMgZ28KdGhyb3Vn
aC4gVGhlIGlvX3VyaW5nIGhlbHBlcnMgdGhlbiBwYXNzIHRoZSBmbGFncyB0aGUgY2FsbGVy
IGFza2VkIGZvci4KClJlcG9ydGVkLWJ5OiBMdWvDocWhIExhbGluc2vDvSA8bHVrYXNAbGFs
aW5za3kuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+
Ci0tLQogbmV0L3NvY2tldC5jIHwgMTEgKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0L3NvY2tl
dC5jIGIvbmV0L3NvY2tldC5jCmluZGV4IDJlM2I1NzM3YzQ4MS4uMDg2NThhOWI4MDY1IDEw
MDY0NAotLS0gYS9uZXQvc29ja2V0LmMKKysrIGIvbmV0L3NvY2tldC5jCkBAIC0yNjk3LDgg
KzI2OTcsNiBAQCBzdGF0aWMgaW50IF9fX19zeXNfc2VuZG1zZyhzdHJ1Y3Qgc29ja2V0ICpz
b2NrLCBzdHJ1Y3QgbXNnaGRyICptc2dfc3lzLAogCWZsYWdzICY9IH5NU0dfSU5URVJOQUxf
U0VORE1TR19GTEFHUzsKIAltc2dfc3lzLT5tc2dfZmxhZ3MgPSBmbGFnczsKIAotCWlmIChz
b2NrLT5maWxlLT5mX2ZsYWdzICYgT19OT05CTE9DSykKLQkJbXNnX3N5cy0+bXNnX2ZsYWdz
IHw9IE1TR19ET05UV0FJVDsKIAkvKgogCSAqIElmIHRoaXMgaXMgc2VuZG1tc2coKSBhbmQg
Y3VycmVudCBkZXN0aW5hdGlvbiBhZGRyZXNzIGlzIHNhbWUgYXMKIAkgKiBwcmV2aW91c2x5
IHN1Y2NlZWRlZCBhZGRyZXNzLCBvbWl0IGFza2luZyBMU00ncyBkZWNpc2lvbi4KQEAgLTI3
NjIsNiArMjc2MCw5IEBAIHN0YXRpYyBpbnQgX19fc3lzX3NlbmRtc2coc3RydWN0IHNvY2tl
dCAqc29jaywgc3RydWN0IHVzZXJfbXNnaGRyIF9fdXNlciAqbXNnLAogCiAJbXNnX3N5cy0+
bXNnX25hbWUgPSAmYWRkcmVzczsKIAorCWlmIChzb2NrLT5maWxlLT5mX2ZsYWdzICYgT19O
T05CTE9DSykKKwkJZmxhZ3MgfD0gTVNHX0RPTlRXQUlUOworCiAJZXJyID0gc2VuZG1zZ19j
b3B5X21zZ2hkcihtc2dfc3lzLCBtc2csIGZsYWdzLCAmaW92KTsKIAlpZiAoZXJyIDwgMCkK
IAkJcmV0dXJuIGVycjsKQEAgLTI5MjYsOSArMjkyNyw2IEBAIHN0YXRpYyBpbnQgX19fX3N5
c19yZWN2bXNnKHN0cnVjdCBzb2NrZXQgKnNvY2ssIHN0cnVjdCBtc2doZHIgKm1zZ19zeXMs
CiAJLyogV2UgYXNzdW1lIGFsbCBrZXJuZWwgY29kZSBrbm93cyB0aGUgc2l6ZSBvZiBzb2Nr
YWRkcl9zdG9yYWdlICovCiAJbXNnX3N5cy0+bXNnX25hbWVsZW4gPSAwOwogCi0JaWYgKHNv
Y2stPmZpbGUtPmZfZmxhZ3MgJiBPX05PTkJMT0NLKQotCQlmbGFncyB8PSBNU0dfRE9OVFdB
SVQ7Ci0KIAlpZiAodW5saWtlbHkobm9zZWMpKQogCQllcnIgPSBzb2NrX3JlY3Ztc2dfbm9z
ZWMoc29jaywgbXNnX3N5cywgZmxhZ3MpOwogCWVsc2UKQEAgLTI5NzAsNiArMjk2OCw5IEBA
IHN0YXRpYyBpbnQgX19fc3lzX3JlY3Ztc2coc3RydWN0IHNvY2tldCAqc29jaywgc3RydWN0
IHVzZXJfbXNnaGRyIF9fdXNlciAqbXNnLAogCXN0cnVjdCBzb2NrYWRkciBfX3VzZXIgKnVh
ZGRyOwogCXNzaXplX3QgZXJyOwogCisJaWYgKHNvY2stPmZpbGUtPmZfZmxhZ3MgJiBPX05P
TkJMT0NLKQorCQlmbGFncyB8PSBNU0dfRE9OVFdBSVQ7CisKIAllcnIgPSByZWN2bXNnX2Nv
cHlfbXNnaGRyKG1zZ19zeXMsIG1zZywgZmxhZ3MsICZ1YWRkciwgJmlvdik7CiAJaWYgKGVy
ciA8IDApCiAJCXJldHVybiBlcnI7Ci0tIAoyLjU2LjAKCg==
--------------XhqjskzGhUXkj0mcLeog29bQ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-io_uring-poll-don-t-poll-a-writer-for-a-read-side-ha.patch"
Content-Disposition: attachment;
 filename*0="0001-io_uring-poll-don-t-poll-a-writer-for-a-read-side-ha.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzODQ1OTgwNmU2ODQxM2M4NDUyMWEwNWQ3ZWVmM2U4OWEyYjI5NTA3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkRh
dGU6IFRodSwgMjkgT2N0IDIwMjYgMTM6Mzg6MTggLTA2MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gaW9fdXJpbmcvcG9sbDogZG9uJ3QgcG9sbCBhIHdyaXRlciBmb3IgYSByZWFkIHNpZGUg
aGFuZ3VwCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cgppb19pbml0X3Bv
bGxfaW9jYigpIGFkZHMgRVBPTExSREhVUCB0byBldmVyeSBwb2xsLCBpbmNsdWRpbmcgdGhl
IGFzeW5jCnBvbGwgb2YgYSBzZW5kIHRoYXQgd2FpdHMgZm9yIGJ1ZmZlciBzcGFjZS4gT25j
ZSB0aGUgcGVlciBoYXMgc2h1dCBkb3duCml0cyBzZW5kaW5nIHNpZGUsIHRoZSBzb2NrZXQg
a2VlcHMgcmVwb3J0aW5nIEVQT0xMUkRIVVAsIHNvIGVhY2ggcmUtYXJtCmluIF9faW9fYXJt
X3BvbGxfaGFuZGxlcigpIGZpbmRzIGEgcmVhZHkgbWFzayBhbmQgdGhlIHJlcXVlc3QgaXMg
aXNzdWVkCmFnYWluLiBUaGUgc2VuZCBzdGlsbCBjYW4ndCBtYWtlIHByb2dyZXNzLCB0aGUg
cmVxdWVzdCBidXJucyB0aHJvdWdoCkFQT0xMX01BWF9SRVRSWSBpbiBhIGZldyBtaWxsaXNl
Y29uZHMgYW5kIGVuZHMgdXAgaW4gaW8td3EuCgpBIHNlbmQgaW4gaW8td3EgYmxvY2tzIHVu
dGlsIHRoZSBwZWVyIHJlYWRzLCBidXQgc2VuZG1zZyBhbmQgd3JpdGV2IGdvCnRocm91Z2gg
X19fX3N5c19zZW5kbXNnKCkgYW5kIHNvY2tfd3JpdGVfaXRlcigpLCB3aGljaCB0dXJuIE9f
Tk9OQkxPQ0sKaW50byBNU0dfRE9OVFdBSVQsIGFuZCB0aGUgYXBwbGljYXRpb24gZ2V0cyAt
RUFHQUlOIGZvciBhIHJlcXVlc3QgdGhhdApuZXZlciBhc2tlZCBmb3IgYSBub24tYmxvY2tp
bmcgc2VuZC4KCk9ubHkgYWRkIEVQT0xMUkRIVVAgZm9yIHBvbGxzIHRoYXQgd2FudCB0byBy
ZWFkLiBBIHBlZXIgdGhhdCBzdG9wcGVkCnNlbmRpbmcgaXMgbm8gZXZlbnQgZm9yIGEgd3Jp
dGVyLCBhbmQgYSBwb2xsIHRoYXQgYXNrcyBmb3IgaXQgZXhwbGljaXRseQpzdGlsbCBnZXRz
IGl0LgoKRml4ZXM6IDQ2NGRjYTYxMmJjNiAoImlvX3VyaW5nOiBtYXNrIGluIGVycm9yL252
YWwvaGFuZ3VwIGNvbnNpc3RlbnRseSBmb3IgcG9sbCIpClJlcG9ydGVkLWJ5OiBMdWvDocWh
IExhbGluc2vDvSA8bHVrYXNAbGFsaW5za3kuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+Ci0tLQogaW9fdXJpbmcvcG9sbC5jIHwgMTggKysrKysr
KysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pb191cmluZy9wb2xsLmMgYi9pb191cmluZy9wb2xs
LmMKaW5kZXggNGYwNGJkYTQyZjdmLi5hYzI5Nzk1ODZiNGYgMTAwNjQ0Ci0tLSBhL2lvX3Vy
aW5nL3BvbGwuYworKysgYi9pb191cmluZy9wb2xsLmMKQEAgLTEyOCwxMiArMTI4LDI0IEBA
IHN0YXRpYyB2b2lkIGlvX3BvbGxfcmVxX2luc2VydChzdHJ1Y3QgaW9fa2lvY2IgKnJlcSkK
IAlobGlzdF9hZGRfaGVhZCgmcmVxLT5oYXNoX25vZGUsICZ0YWJsZS0+aGJzW2luZGV4XS5s
aXN0KTsKIH0KIAorI2RlZmluZSBJT19QT0xMX1VOTUFTSwkoRVBPTExFUlJ8RVBPTExIVVB8
RVBPTExOVkFMKQorCitzdGF0aWMgX19wb2xsX3QgaW9fcG9sbF91bm1hc2soX19wb2xsX3Qg
ZXZlbnRzKQoreworCS8qCisJICogQSBwZWVyIHRoYXQgc3RvcHBlZCBzZW5kaW5nIGlzIGFu
IGV2ZW50IGZvciBhIHJlYWRlciwgYnV0IGEgd3JpdGUKKwkgKiBvbmx5IHBvbGwgbXVzdCBz
dGF5IGFybWVkIHVudGlsIHRoZSBmaWxlIGlzIHdyaXRhYmxlIGFnYWluLgorCSAqLworCWlm
IChldmVudHMgJiAoRVBPTExJTiB8IEVQT0xMUkROT1JNIHwgRVBPTExSREJBTkQpKQorCQly
ZXR1cm4gSU9fUE9MTF9VTk1BU0sgfCBFUE9MTFJESFVQOworCXJldHVybiBJT19QT0xMX1VO
TUFTSzsKK30KKwogc3RhdGljIHZvaWQgaW9faW5pdF9wb2xsX2lvY2Ioc3RydWN0IGlvX3Bv
bGwgKnBvbGwsIF9fcG9sbF90IGV2ZW50cykKIHsKIAlwb2xsLT5oZWFkID0gTlVMTDsKLSNk
ZWZpbmUgSU9fUE9MTF9VTk1BU0sJKEVQT0xMRVJSfEVQT0xMSFVQfEVQT0xMTlZBTHxFUE9M
TFJESFVQKQogCS8qIG1hc2sgaW4gZXZlbnRzIHRoYXQgd2UgYWx3YXlzIHdhbnQvbmVlZCAq
LwotCXBvbGwtPmV2ZW50cyA9IGV2ZW50cyB8IElPX1BPTExfVU5NQVNLOworCXBvbGwtPmV2
ZW50cyA9IGV2ZW50cyB8IGlvX3BvbGxfdW5tYXNrKGV2ZW50cyk7CiAJSU5JVF9MSVNUX0hF
QUQoJnBvbGwtPndhaXQuZW50cnkpOwogCWluaXRfd2FpdHF1ZXVlX2Z1bmNfZW50cnkoJnBv
bGwtPndhaXQsIGlvX3BvbGxfd2FrZSk7CiB9CkBAIC05NzEsNyArOTgzLDcgQEAgaW50IGlv
X3BvbGxfcmVtb3ZlKHN0cnVjdCBpb19raW9jYiAqcmVxLCB1bnNpZ25lZCBpbnQgaXNzdWVf
ZmxhZ3MpCiAKIAkJCXBvbGwtPmV2ZW50cyAmPSB+MHhmZmZmOwogCQkJcG9sbC0+ZXZlbnRz
IHw9IHBvbGxfdXBkYXRlLT5ldmVudHMgJiAweGZmZmY7Ci0JCQlwb2xsLT5ldmVudHMgfD0g
SU9fUE9MTF9VTk1BU0s7CisJCQlwb2xsLT5ldmVudHMgfD0gaW9fcG9sbF91bm1hc2socG9s
bC0+ZXZlbnRzKTsKIAkJfQogCQlpZiAocG9sbF91cGRhdGUtPnVwZGF0ZV91c2VyX2RhdGEp
CiAJCQlwcmVxLT5jcWUudXNlcl9kYXRhID0gcG9sbF91cGRhdGUtPm5ld191c2VyX2RhdGE7
Ci0tIAoyLjU2LjAKCg==

--------------XhqjskzGhUXkj0mcLeog29bQ--
