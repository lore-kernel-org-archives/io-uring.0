Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255A476049
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962222; cv=none; b=Lc1NZXBBX46RnBBxB2vgVDaR9vSA3fsz/Ak/D576oiH9CMiyByc0/+GPEj1VUKehziOXXlWv/05QcimW+pbURyio/lnzoB29Cx0+8B5Sk8puIZrwRFlEr1JHtg1zJTuPWL8CH7RpzXjll1XNILgzlu27o+DfFDkA8nxFQjkrTOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962222; c=relaxed/simple;
	bh=OG66/W9xP/T+E5n8aa6wxhobUDvh4QNzT0djep+/BeM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HxHP9E3YxydrkLXHt3ZT8N/yQ0yLZgMDNenJcb6elDtC8bnczRF8ZpQg7NDJKQvWfNbl9O6eYNwmPOwIbMe6mWhTSmTsTg47wll9OOSWbphEo+W+wG03hQvek6sWka/KtIJopyosQR/wLGalZdKDszbcqbtb5b9LZ8aM2gxIjwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=sSSsP74D; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="sSSsP74D"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb61bbeb25so5481095a34.1
        for <io-uring@vger.kernel.org>; Wed, 09 Sep 2026 06:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788962218; x=1789567018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Izff34GpIlMgrbcmpOUE6ehHq98Xxkap9RJGHMjnE1U=;
        b=sSSsP74DYnZ9nXz7/VQXgbqPOZxb0bdlGKW0Sg9oTXNgtVVMTa6kKMYqzZAoI7xvk7
         JJetQgeLn140AvfndH7V5l596CSARV4mclS4dypDH2nnJWAyvJZpaGpb35lX3m/oiJwI
         F3Otv4nbdZ9jbrdsKjPvGhFcShRS/IJoPJgbTOl9wt6I/BC//74WEo+REdTN43+GxUL0
         Okl3dEon9Day4vKr5GQa42l7ckcJpZQOeRE+o+oNu08FTnHvFY3beU6EQFReXZFAPnun
         eznS7gauiNt6gTyk0Zt/oNFbJfF7nGNvo4IEb5gSrVF25E5lWgNqjIIGRhcSkoymMcP/
         osLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962218; x=1789567018;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Izff34GpIlMgrbcmpOUE6ehHq98Xxkap9RJGHMjnE1U=;
        b=RnNtPYl36X0FafSGyZFZ7uENQP4zN/kr/0r5Ex4a56hVDzsX++jHMYyvr8hP4etc6Q
         A5i42sUsc+KPRTrJozftZ6HaoU5svBI3YJEMaYjNyGnFODqSDzL9oTHy7XbHyqg4Y4Fj
         Qm8RHGj4Vqko1ZpFdR/FlPHAqh2ti9LIhlfYDTRBuFTa78C2qp29hq64+MwuiLs1cMVN
         52s4jOeMVOUgEHuCH0R61WZXJBCH9S5hg8bj0Rlv7hZURG2Wz0T5dvTnYAp9MmWUzApl
         3WjAvqf9xwmCVbsdU5rjkmnWRibCBbiiCQ5aSQEas5FWXWEOmUzleVU7SqJtItbDsE26
         PGiw==
X-Gm-Message-State: AFuF++niFFEBNkoPYAuEMxHduswarjXlzGxUOTpz+lbXI2HYgSBFvJjw
	h/43jFeKP3ZgjTc+hX1oMY75Vm82ad/Loi7MRFpyWOTgkWNxKb1D8WfMVJhfzMP6NSo=
X-Gm-Gg: AYBFou126hnaNlbQQ3zjW9jCl6VI/s+wECzUMe4P2NB11XM9a453fvjvv4ws63WccPO
	PwbOHJqG+f3xJGVMPWa1uZVR+jogqkspNynuc+OfbJuaq0GxcILYoVwPpOqA8kl3kjEjx3e3Saz
	NDHqK72WQqdpin05vnPEpkYcciSCjY+0pWjPF/vyTDZKf4H8OEjT7yQk3sv2uP4L8/89/wrL3Rw
	3bLnO7IfCmNA4tia2ewt7xoyL3QVua0NB54qgmRSD1W4OF2fbroehtF1CLCcKk9vnpjpzhKWenG
	Gi+xhswDBKakbHGANoj4kq219g9fEMhS2JTSZjfuATs9YFdHpZ2MtiWrzFKDVOWLnug37CqNBDO
	w5uR1ZLtDLaBNidk+5SiD2BKLWUV4nQb6tC84/iRVtm8Wyc5nEFy+qWGlDLnP8oQqQOZaaeqoQR
	TYSuunekSEjnXVfrGyAvQzUhPTZTjYQP6ZOIrzh1vImaCJFv4xn+hl+JUmDB64TwcLRccINjcrF
	jD0e2dDAu/J3ly2u9wb639p/AnvNfda48S2tpBclaD3rIZ22lzNaGQ42w==
X-Received: by 2002:a05:6830:64cc:b0:7fa:ac4f:78a with SMTP id 46e09a7af769-7faac4f0e55mr16975714a34.22.1788962218501;
        Wed, 09 Sep 2026 06:56:58 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6794e6fsm17725097a34.9.2026.09.09.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:56:57 -0700 (PDT)
Message-ID: <0f5e8693-dcba-4fa8-87d1-570ac08e2d83@kernel.dk>
Date: Wed, 9 Sep 2026 07:56:57 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 2/2] io_uring/net: don't overconsume buffers when using
 MSG_TRUNC
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 stable@vger.kernel.org
References: <20260902230041.1320658-1-krisman@suse.de>
 <20260902230041.1320658-3-krisman@suse.de>
Content-Language: en-US
In-Reply-To: <20260902230041.1320658-3-krisman@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> When a recv/recvmsg is issued with MSG_TRUNC and the incoming packet is
> larger than the provided buffer, the net layer returns the full length
> of the packet rather than the number of bytes actually copied into the
> buffer.  As a result, io_uring advances more of the provided buffer ring
> than was actually filled.  Use the actual filled region size to consume
> the buffer, but still return the full size to preserve MSG_TRUNC
> semantics.
>
> Take care with multishot, because that seems to already truncate the
> consumption based on the available payload size.
>
> This was reported in https://github.com/axboe/liburing/issues/1619.
>
> Fixes: ae98dbf43d75 ("io_uring/kbuf: add support for incremental buffer consumption")
> Cc: stable@vger.kernel.org
> Link: https://patch.msgid.link/20260728191454.1850326-1-krisman@suse.de
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
> ---
>  io_uring/net.c | 38 +++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/io_uring/net.c b/io_uring/net.c
> index 647156c9331a..f8110dc9f860 100644
> --- a/io_uring/net.c
> +++ b/io_uring/net.c
> @@ -853,7 +853,7 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
>  static inline bool io_recv_finish(struct io_kiocb *req,
>                                   struct io_async_msghdr *kmsg,
>                                   struct io_br_sel *sel, bool mshot_finished,
> -                                 unsigned issue_flags)
> +                                 unsigned issue_flags, size_t consumed)
>  {

Not sure this is correct. If consumed is a size_t, then the comparison
between ret > len is an unsigned comparison, and every error will then
get clamped?

Will need something like this folded in.

diff --git a/io_uring/net.c b/io_uring/net.c
index f8110dc9f860..0ca43a24f1a5 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -853,7 +853,7 @@ int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 static inline bool io_recv_finish(struct io_kiocb *req,
 				  struct io_async_msghdr *kmsg,
 				  struct io_br_sel *sel, bool mshot_finished,
-				  unsigned issue_flags, size_t consumed)
+				  unsigned issue_flags, int consumed)
 {
 	struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
 	unsigned int cflags = 0;
@@ -1027,7 +1027,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 	int ret, min_ret = 0;
 	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
 	bool mshot_finished = true;
-	size_t len, consumed = 0;
+	int consumed = 0;
+	size_t len;
 
 	sock = sock_from_file(req->file);
 	if (unlikely(!sock))
@@ -1080,8 +1081,8 @@ int io_recvmsg(struct io_kiocb *req, unsigned int issue_flags)
 		 * buffer.
 		 */
 		consumed = ret;
-		if (ret > len)
-			consumed = len;
+		if (ret > 0)
+			consumed = min_t(size_t, ret, len);
 	}
 
 	if (ret < min_ret) {
@@ -1195,10 +1196,11 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_br_sel sel;
 	struct socket *sock;
 	unsigned flags;
-	int ret, min_ret = 0;
-	size_t consumed = 0, len = 0;
+	int ret, min_ret = 0, consumed = 0;
+	int consumed = 0;
 	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
 	bool mshot_finished;
+	size_t len = 0;
 
 	sock = sock_from_file(req->file);
 	if (unlikely(!sock))
@@ -1273,8 +1275,8 @@ int io_recv(struct io_kiocb *req, unsigned int issue_flags)
 	 * buffer.
 	 */
 	consumed = ret;
-	if (ret > len)
-		consumed = len;
+	if (ret > 0)
+		consumed = min_t(size_t, ret, len);
 
 	if (ret > 0)
 		ret += sr->done_io;

-- 
Jens Axboe

