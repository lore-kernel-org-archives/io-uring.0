Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E391437455
	for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751596; cv=pass; b=Nb82/1xAMTRF8qcA9YzsEApsPcZXSPznm/qP+GzaTZn/gcuAHWPfDeT8bLBWFNW9e9oTBBDpU7pNm6RM33HVb7qUFfg+4d2xpQQOdfgn9sHceWG4gbXgtK8R/9g8jtyyW6o5xBgzwDKDmvZ10V7xhRJfZUyrngVNkO30zSKDwdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751596; c=relaxed/simple;
	bh=KgGZhsrPiY+ReOQTpKZCXY9p4PoAkRFroGl54YICe+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbAYGF7YX0JdZ2F9sVAV9fJ71StAYuBo02mWNqx3nYqKRR8WinYHkwphnYW8zzmYSJkmxyyIVphSUhdVE5VCD+QrkI8LhH/4bciSqJ69zuPuAdJbn2CvpuJ9d1Q6N21aCulfC1kBN097/9Bmdy/mEJrXyJzqe3mOLqIqp15fGyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZRVwdX+/; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZRVwdX+/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccdf36f63dso23655ad.0
        for <io-uring@vger.kernel.org>; Wed, 22 Jul 2026 13:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784751585; cv=none;
        d=google.com; s=arc-20260327;
        b=Ke7UnoZJd6x5wCJZRjdpGBlmcKd9ot3n5K3/JvVdX0Y5EfsvWCRRH3vRDHxnjWXalk
         nuhNKZFBJhFkNFxN/oZvQOvi95zL5ZY7M4ZnbT29M8/Phim/G1bgwsSbdmqzLYa7lsez
         9rMoj9Ci8wx5kp0Dg3R5Cr0aH3GHFkOGZJ1KX/eqnWoXJhaQmX+EicmWVJenuU2vzxOX
         VpLjNID3IibXKdwPJm7DmYukVOmt8MO4iy+5DDVPCEW1JsLzl8q1QTB/eYC8O5rXsRD/
         FpXijS9QWAiRvTyDGZcyDwpTzJ3A7R821uLJDHN70jCI4dmPeaY7HU7VPiJpxWbGltLG
         KcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KgGZhsrPiY+ReOQTpKZCXY9p4PoAkRFroGl54YICe+s=;
        fh=dSlZPusUycofQjA4HtMTbFjCkinFQeCaTDaPmexJCCc=;
        b=Zqpfhbmzk+5PdbJobd/BttNu/9LoCzc1r27vHUa3Ennyu3VG64ohp1eGgzAk0hPK9j
         VKvyzkUhT3CwOdj+473/SIjFt1eVKAhOY1esR3sfsNtVS8A+v4mWxbBWg8b9DOshvDfE
         UABTErdzTWSoRpU23rqr2/4NHwpSzEMM9CZOkI1PfG4WHbODecilMqAygNQxh1fk9VFM
         EJUYht1A0kP7w6Ck61qq//TJbyNMlKDzPWqmXC0laC9ACYxb/MSj6AeOWhex6vYKmFu4
         zLtVh6lvjwJkWnd6d2E16U0iTYOBF+S+kWQc3D1WrmkktuecN5zE7u7eS9nA4d5Frzmi
         LRPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784751585; x=1785356385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KgGZhsrPiY+ReOQTpKZCXY9p4PoAkRFroGl54YICe+s=;
        b=ZRVwdX+/Nip5IKj4HMHufADleWfppU+aeynMqe+A8/zcrTznU3EKFG8ZD+ehL8KrEh
         bxbvCpktYI/K4aBa4QxdYYr/T3b7O8L+aPOt6zOs/Kr/G7M5L1xnWz/MdZShPwLE3IbI
         aSBp9E6bmDB43p0FYkICYpCbHw4xX4cmYqrucGOFCWYxIoQJESjqcPkylvOiJFIyzwjM
         MfDWUdXEK24QxYYBhpFoM1mr7RiAJ8P7+JbWkiK+xgODHF8uylxwJ/BjsRYIHFStTNGp
         fM/RWqRPzI7D90eRYWu9HRK0v2IlcPccV6W7nO0Mcc22G03itSxRs7m8I/rYUG67hgC0
         OvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751585; x=1785356385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgGZhsrPiY+ReOQTpKZCXY9p4PoAkRFroGl54YICe+s=;
        b=BBqp2sKRBda6FEjQ2nk+ZXX43zY46Sj2zE+1Z2rFNi+vWbtD5rXev94RTBL0XKp3xK
         Uy6D9yUhVgvR402L0OXHsRpfyvizJOm/v8lZqlwIishouO9X0GAiNMs/ikDp0AF/1Bi0
         2BPtuV65xWj3xCxlJwpZubO7+UMT1CyWDM9jacKeZ5cliqf18o5QXDoZJJMaP/6xW+9O
         7L2CPGMf2hC6+9olfPHmP+hX0vUATaXtTFfVEO1vweH+iig3XC0xr2VGBzX1fnDdq7M0
         n8XamHsapf/2YNyJNsd+MvQt3Z5P5Taj2i8ZHylj4nvArUD+J/muE99cbdKWEW0PFwPW
         +EVg==
X-Gm-Message-State: AOJu0Yy/sMhGoFV68db4EE9Jjp24wHbjnmHfxTerFO9T84iYf40PePFc
	nMmnO1Do5v77qthU892aFCxBku4N61/t1qbz5VWHBLOTXgo5wxcGp4UqUU8TlcJKoedfAFJD0cp
	+7/K4wxUk6mIe3GT06BHDivcbiWwGjiSLEfGo1Ysm
X-Gm-Gg: AR+sD12KjqiYX7WNLKuJH//Dkd5isgTrKEM7jEFOj70XxjkDObIdeH6z2niiuyraA39
	FDi9LntgsSvRj6ejuRAVKBKRfwEFpicETzpVYqQmzBkhjn5yyZLnkSsen2nB+nCSIweCFGH643B
	8wWcPfCK/UYyhZ2JXnKi5U03BSQLYHE4clOPCkGZte8UmJZvoXhO0leZE9//5AtuzNSdwEgA1go
	UwsGaRLZt6LMcoYaSkrljyKmyum+8QJXTcIxKWelhjDEbbj12ZdgOchItWREu5xSJCVtfBxu57z
	uDq3SaSqHaVv9dJUKKvyDTnc00E=
X-Received: by 2002:a17:902:ef97:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2cfa807b694mr161795ad.25.1784751584053; Wed, 22 Jul 2026
 13:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1784726895.git.asml.silence@gmail.com> <f95ca6717da3c8d3649a1a7f0d883a563f545052.1784726895.git.asml.silence@gmail.com>
 <CAHS8izOhJN0YzQ8ybYm57Hd-Mu8PMc2a-NZ-K-N504LzEeTpfQ@mail.gmail.com> <c3cf5d0e-103b-484f-956d-5f00c1e48be0@gmail.com>
In-Reply-To: <c3cf5d0e-103b-484f-956d-5f00c1e48be0@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 22 Jul 2026 13:19:31 -0700
X-Gm-Features: AUfX_mxYAdzUEWZSC3CkWFFDSKDOjuXZtOxgWOEf56xAG72XZK7cZejZegnjDi8
Message-ID: <CAHS8izNEr42=17WD9BdfzFMKKuGoUJhU=g_rUkr780fdKS9fkQ@mail.gmail.com>
Subject: Re: [PATCH io_uring-7.2 3/3] io_uring/zcrx: rename notif to event
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 1:11=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 7/22/26 20:37, Mina Almasry wrote:
> > On Wed, Jul 22, 2026 at 6:51=E2=80=AFAM Pavel Begunkov <asml.silence@gm=
ail.com> wrote:
> >>
> >> "Notification" is too long and the abbreviated version is used in
> >> several places, which is inconsistent and more ambiguous for users.
> >> Rename it to event, which is easier to keep consistent. To keep the
> >> change small, only change uapi/ + do necessary fix ups, and the rest o=
f
> >> internals can be adjusted in the next release.
> >>
> >> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> >
> > Probably a basic question, but isn't the stuff under uapi/ supposed to
> > be a stable user api? Why is it not a concern that you're breaking
> > current users with this change?
>
> That's so only once it's released. It was done for 7.2, so it's
> fine as long as it hits some 7.2-rc*.
>

Ah, you're trying to switch before the release goes out. I guess FWIW:

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
