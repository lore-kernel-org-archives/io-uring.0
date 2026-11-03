Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721647;
	b=sqbNBwPLXDg3QSZZOsc0xq2sXVrD3QDQ3YJe5Dq0PKPS0AarvQ8/fwoOh94dvxKqUrIx
	 xgNce8zmtLCYmNYNYmrW6+4u7qZG74SHB/2s94fC6gfYoQYrEMD4bdgdsBKbEDKmkvx/X
	 n2PaBxo5dRsAJCKUzqo/HaSc4+jBxHIrz+JON4ECNAzXwnKqZk4AwEQ0AT6OxkzPSzYdL
	 yGGcKq2Xsg6/gplZw5zFsn5sF3tnsvzz+n0FiTA0i20DnsPwn6owB4PUt7RRENomgJOGr
	 UWEXJvUSjAU0KRfpNwu8H89H+7Ajc8ifeQq7APEh/e0jlmSOywDDrJ9do7Kr2NLUOzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wnA7Z5mup1DWxja4bJQy8keeT4WyX3vb+WJUbBZkpng=;
	b=wl6eaIgF1GazKh5xKf/hAs+VO7N1Ar8CRdIFnQG+CUicpY9QPAeHdNbzfa0vIFTe2XKY
	 oJheHB5hkqwDN3ybxBtCog1JJZdR/Eqg0RSzsw7F0wzIZ2EB5O3b+tLjanFdXZIz/uAKH
	 6j7Ii4UnRp3yJSY12fMocIaW/Vmh1ALkB/HIRbBDD+fNi/gUdIxBvSwtM8B5nDWFUoNw3
	 DxmxyvWRhlShd4vhruOpqWXose0XbpHQd/Nce+aFRo8TuMzLxDK3g5mPx7mjoC3wdJ51c
	 DHz+9Dj5AKHsyf86oEDLU9TTAPbh++b3vIYrj8ewpS3lKm7YEODx+X5i0HYYBcRRr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bi7YS0qR;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63354606D80C
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 16:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63354606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bi7YS0qR
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a85c656c58so2630670fac.3
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 08:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793721644; x=1794326444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnA7Z5mup1DWxja4bJQy8keeT4WyX3vb+WJUbBZkpng=;
        b=bi7YS0qRzucez5jbFXPUwolcYg5aYXg7BJt3OZ00MJuUPBTtVhGIzfAL3ZRQTbjZIO
         yheSxMUQ0rU7YGFlv5Gw6Bd61flF0j8+6xkEQ1Ivz5sK4Na7h5gef2QcbyuibYeOEmDo
         dMMwyEUaUCpC+dT4YnI9TdZyqdh//76Zi11n65afJ1XYelJQm0K+of2/QtVSRlqHiqyL
         Z9rqvRFnoUVTg9OPOoL/La3ED1yExtVtcuUTznpZipPrzDNvJgVps51RzfH/BI/Glzqu
         lDAsmgHWzQh7vsg2TWvAymsr95sO9LOGO5qeZBpjst8mwqYj+oCRwlsLnr3yNprq1YN7
         GBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721644; x=1794326444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnA7Z5mup1DWxja4bJQy8keeT4WyX3vb+WJUbBZkpng=;
        b=z/QqMTMoE2mq+IxuFuc0q8FOshmT87CTGhPrBNSRUCcKN1Y65V9iy7PUI79R2lTrnr
         VXN9x6oIVMaQT3sUD0SP4hLLhps9oBZzoOWx7f/xlDRyV7CPCRnMMQmtgEyJ+OcZRNzE
         ieHEdsREghSftF4+scpsSQ08AqHJYnIRH5zlnxwIcB+2ddNRyIcDuaKTt4V/kbfVeEBy
         gJQxQSunGrxVvMc8wItXUkZotpPUmzdkn6EEihM8Vezi95NxU5gzsTidM84PlfknUwlj
         YAXOk8aR8/4uaAw9Skd40RrOcnWftcfsWAYnSPdz99cOka7VDqSNM2UMNsFnF9GjYzui
         30bg==
X-Gm-Message-State: APuU4Z+X9Fgrev6djGVQQM47KnCIsMA6Kypymx3kqOwA/qJTUhlaRfeX
	M5jOqIm73oQECEnJcDz6dKjvnnLU7JvC42iSm3wNmwhFd23WKLje9gC6Jp52ebHcZUdIPKFLKwj
	uRQ8unQ0=
X-Gm-Gg: AYBFou3o3xlzH5cA+l2y0gC2+G3VZmTao/UEFx8QnPHJO00dcxDIrFC1L8sP7RfZv8H
	mFL2n03kqgquwdSHN45dGTRjilCqJUYM5D18flzq+Oqjo9aGtkPwHFhCOBA9RY8w0WQUinty9Ee
	svC1CcSSe3INM5k5DputFdgkbUbDkse0GJ3CCq6lvwDNeHmEc9yohdooLGxZtqWBPznGmYYXLf2
	cV2wC382GBf598G65UphqL2BYEtHDnctDbxsP9nSZP4aGJ2NwgQYuuW/kd8RIw6L5sDs2DxLOM6
	DuEfdjCZdlbSaK3hp8LvwCZkVtXDtjNP4MEl7wFeYXslt28L1UDxTksUsjEETLRqMUMCGbcX0F7
	BqLF60MX1QaR659FTCzgOVle5D18osqRpg7leOxKMHFPNWgua4jBhlrn75ow30wxELLsQrGBHwK
	2K9r/q2H7Y+SQRozuXHuLHQn7g8MiEXYAo4Fw0esZtK17JULUgm+SC8ScEiANtDEjatJ6W/A5/g
	57gm/mSwpwyZ1yTz/QA6Jshoe4ajUTlTP5JW5dSW+yCfY5mQVdN4XNyKcz5DWDARKIU2A3g11EF
	XLc6PN61QiFfR/ycuyQNCeBXrtpYuJEaf5QNu5qcAAGCC5yfzhdNWGuWi8LC1ImnuYjctS+Jy9R
	orkrw2ohm
X-Received: by 2002:a05:6870:2056:b0:48f:e107:8e48 with SMTP id 586e51a60fabf-4a907749805mr7902885fac.41.1793721644150;
        Tue, 03 Nov 2026 08:00:44 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a9219148cbsm8674533fac.3.2026.11.03.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:00:43 -0800 (PST)
Message-ID: <3face247-a7b6-4f87-9863-5ad40cc272a0@kernel.dk>
Date: Tue, 3 Nov 2026 09:00:42 -0700
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
 <b06ee030-51b0-433b-9988-148615e35ad1@kernel.dk>
 <6fdd17d9-0ab9-45ac-b45f-fccf085372a8@app.fastmail.com>
 <5475728c-6cd9-4d61-bcee-5c8a42f1951d@app.fastmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5475728c-6cd9-4d61-bcee-5c8a42f1951d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 7:00 AM, Luk?? Lalinsk? wrote:
> On Thu, Oct 29, 2026, at 9:42 PM, Luk?? Lalinsk? wrote:
>> There is one more inconsistency even with both patches applied:
>> in the urgent data case, WRITEV on an O_NONBLOCK socket still completes
>> with -EAGAIN, while SEND and SENDMSG on the same socket keep waiting.
>> So whether WRITEV waits or fails depends on whether the peer sent
>> urgent data, which the application can't really predict. It's not a
>> problem for me, since I always use SEND/SENDMSG on sockets, but it is
>> an inconsistent behavior.
> 
> Hi Jens,
> 
> I ran into one more issue while testing this. The SEND or SENDMSG
> operations become uncancelable for a brief time after submission,
> either in the half-closed state before your patches, or with the urgent
> data flag after your patches. If ASYNC_CANCEL is submitted right
> after the send on such socket, it completes with -ENOENT, but the
> send stays pending. A second cancel issued later finds it. Without the
> urgent data, the first cancel finds it and the send completes with
> -ECANCELED. Your patches made it work properly for the half-closed
> case.

Can you try with this on top?

diff --git a/io_uring/poll.c b/io_uring/poll.c
index ac2979586b4f..82485e1350dd 100644
--- a/io_uring/poll.c
+++ b/io_uring/poll.c
@@ -739,7 +739,7 @@ int io_arm_apoll(struct io_kiocb *req, unsigned issue_flags, __poll_t mask)
 int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
 {
 	const struct io_issue_def *def = &io_issue_defs[req->opcode];
-	__poll_t mask = POLLPRI | POLLERR;
+	__poll_t mask = EPOLLERR;
 
 	if (!def->pollin && !def->pollout)
 		return IO_APOLL_ABORTED;
@@ -747,7 +747,8 @@ int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
 		return IO_APOLL_ABORTED;
 
 	if (def->pollin) {
-		mask |= EPOLLIN | EPOLLRDNORM;
+		/* urgent data is an event for a reader only */
+		mask |= EPOLLIN | EPOLLRDNORM | EPOLLPRI;
 
 		/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
 		if (req->flags & REQ_F_CLEAR_POLLIN)

-- 
Jens Axboe
